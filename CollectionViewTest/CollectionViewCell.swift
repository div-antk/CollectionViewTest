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
    
    var count = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 角丸
        mainCard.layer.cornerRadius = 12
        
        // 影
        mainCard.layer.shadowColor = UIColor.black.cgColor
        mainCard.layer.shadowOpacity = 0.5
        mainCard.layer.shadowRadius = 8
        mainCard.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        
        // プログレスバー
        let progressBar = UIProgressView(progressViewStyle: .default)
        
        // 進捗の割合（0.0～1.0）
//        progressBar.progress = 1.0
        
        // 進捗の割合の設定（0.0～1.0 ）とアニメーションの有無
        progressBar.setProgress(Float(count), animated: true)
        
        // スタイル
        progressBar.progressViewStyle = .bar
        
        // バーの色を取得
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        
        
    }
}
