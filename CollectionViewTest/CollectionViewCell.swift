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
    
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var beCircle: UIButton!
    
    var count: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        beCircle.layer.cornerRadius = 50
        
        // 角丸
        mainCard.layer.cornerRadius = 12
        
        // 影
        mainCard.layer.shadowColor = UIColor.black.cgColor
        mainCard.layer.shadowOpacity = 0.5
        mainCard.layer.shadowRadius = 8
        mainCard.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        
        // プログレスバー
        // 進捗の割合の設定（0.0～1.0 ）とアニメーションの有無
        progressBar.setProgress(0, animated: true)
        
        // スタイル
        progressBar.progressViewStyle = .default
        
        // 進捗バーの色
        progressBar.progressTintColor = UIColor.orange
        
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        
        count += 1000

        let per: Float = Float(50000 / count) * 0.01
        
        progress.text = String(count)
        
//        let progressCount += 0.1
        
        progressBar.setProgress(progressBar.progress + per, animated: true)
        
        
    }
}
