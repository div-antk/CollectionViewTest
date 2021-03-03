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
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cardCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 400, height: 500)
        collectionView.collectionViewLayout = layout
    }

    // セクションの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
}

