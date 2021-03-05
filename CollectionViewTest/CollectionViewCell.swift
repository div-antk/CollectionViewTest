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
    
    var count: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        // 角丸
        mainCard.layer.cornerRadius = 12
        
        // プログレスバー
        // 進捗の割合の設定（0.0～1.0 ）とアニメーションの有無
        progressBar.setProgress(0, animated: true)
        
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
