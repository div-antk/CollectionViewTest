//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Takuya Ando on 2021/03/02.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle.main)
        let secondNib = UINib(nibName: "CollectionViewCell2", bundle: Bundle.main)
        let imageNib = UINib(nibName: "ImageCollectionViewCell", bundle: Bundle.main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cardCell")
        collectionView.register(secondNib, forCellWithReuseIdentifier: "buttonsCell")
        collectionView.register(imageNib, forCellWithReuseIdentifier: "imageCell")

    }

    // セクションの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    // セクションの総数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        switch (indexPath.section) {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CollectionViewCell
            
            // 影
            cell.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowRadius = 4
            cell.layer.shadowOffset = CGSize(width: 2, height: 2)
            
            return cell

        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "buttonsCell", for: indexPath) as! CollectionViewCell2
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
            
//            let imageData:UIImage = UIImage(named:"banner1")!
            cell.imageView.image = UIImage(named: "banner1")!
            
            return cell

        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.imageView.image = UIImage(named: "banner2")!

            return cell

        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.imageView.image = UIImage(named: "banner3")!

            return cell

        default:
            return UICollectionViewCell()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch (indexPath.section) {
        case 0:
            return CGSize(width: view.frame.width - 80, height: 200)
            
        case 1:
            return CGSize(width: view.frame.width, height: 200)
        case 2:
            return CGSize(width: view.frame.width, height: 200)
        case 3:
            return CGSize(width: view.frame.width, height: 200)
        case 4:
            return CGSize(width: view.frame.width, height: 200)

        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    // 外枠の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
