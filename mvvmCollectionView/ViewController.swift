//
//  ViewController.swift
//  mvvmCollectionView
//
//  Created by sweta makuwala on 14/10/22.
//

import UIKit

class ViewController: UIViewController {

    weak var collectionViewVertical: UICollectionView!

       override func loadView() {
           super.loadView()

           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.showsVerticalScrollIndicator = true
           self.view.addSubview(collectionView)
           NSLayoutConstraint.activate([
               collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
              // collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
               collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
               collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
               collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2),
              
           ])
           
           self.collectionViewVertical = collectionView
       }

       override func viewDidLoad() {
           super.viewDidLoad()

           self.collectionViewVertical.backgroundColor = .white
           self.collectionViewVertical.dataSource = self
           self.collectionViewVertical.delegate = self
           self.collectionViewVertical.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
       }
   }

   extension ViewController: UICollectionViewDataSource {

       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 50
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
           cell.textLabel.text = String(indexPath.row + 1)
           return cell
       }
   }

   extension ViewController: UICollectionViewDelegate {

       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print(indexPath.row + 1)
       }
   }

   extension ViewController: UICollectionViewDelegateFlowLayout {

       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {

           return CGSize(width: (collectionView.bounds.size.width / 2) - 15 , height: 30)
       }
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }

       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }

       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
       }


}

