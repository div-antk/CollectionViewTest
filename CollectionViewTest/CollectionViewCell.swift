//
//  CollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Takuya Ando on 2021/03/02.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainCard: UIView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 角丸
        mainCard.layer.cornerRadius = 12
        
        // 影
        mainCard.layer.shadowColor = UIColor.black.cgColor
        mainCard.layer.shadowOpacity = 0.5
        mainCard.layer.shadowRadius = 8
        mainCard.layer.shadowOffset = CGSize(width: 4, height: 4)
        
    }

}
