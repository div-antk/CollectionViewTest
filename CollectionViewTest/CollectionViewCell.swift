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
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        // 角丸
        mainCard.layer.cornerRadius = 12

        // プログレスバー
        // 進捗率の計算
        let progress = Float(leftLabel.text!)! / Float(maxLabel.text!)!
        // 進捗バーの色
        progressBar.progressTintColor = UIColor.orange
        // 進捗の割合の設定（0.0～1.0）とアニメーションの有無
        progressBar.setProgress(progress, animated: true)
    }

    @IBAction func buttonAction(_ sender: Any) {
        
//        leftLabel.text as! Int += 1000
    }
}
