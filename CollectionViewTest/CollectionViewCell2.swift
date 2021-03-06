//
//  CollectionViewCell2.swift
//  CollectionViewTest
//
//  Created by Takuya Ando on 2021/03/07.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        one.layer.cornerRadius = 30
    }
}
