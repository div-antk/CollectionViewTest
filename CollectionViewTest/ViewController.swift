//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Takuya Ando on 2021/03/02.
//

import UIKit
import Parchment

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = [UIImage(named: "banner1"), UIImage(named: "banner2"), UIImage(named: "banner3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = UIViewController()
        let secondViewController = UIViewController()

        firstViewController.title = "First"
        secondViewController.title = "Second"

        let pagingViewController = PagingViewController(viewControllers: [
            firstViewController,
            secondViewController
        ])

        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false

        pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pagingViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pagingViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        
//
        // インスタンスを作成して先程作ったVCの配列を入れ込む
//        let pagingVC = PagingViewController(viewControllers: vcs)
//        // それをChildViewControllerに入れる
//        addChild(pagingVC)
//        view.addSubview(pagingVC.view)
//        pagingVC.didMove(toParent: self)
//        pagingVC.view.translatesAutoresizingMaskIntoConstraints = false

        // メニューアイテムの色設定
//        pagingVC.selectedBackgroundColor = .clear
//        pagingVC.indicatorColor = .green
//        pagingVC.textColor = .white
//        pagingVC.selectedTextColor = .green
//        pagingVC.menuBackgroundColor = .clear
//        pagingVC.borderColor = .clear


        
//        NSLayoutConstraint.activate([
//            pagingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            pagingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            pagingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            pagingVC.view.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle.main)
        let secondNib = UINib(nibName: "CollectionViewCell2", bundle: Bundle.main)
        let imageNib = UINib(nibName: "ImageCollectionViewCell", bundle: Bundle.main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cardCell")
        collectionView.register(secondNib, forCellWithReuseIdentifier: "buttonsCell")
        collectionView.register(imageNib, forCellWithReuseIdentifier: "imageCell")
    }
    
    func isPagingVCScrollEnabled(isEnabled: Bool) {
        
            let tabbar = UIApplication.shared.keyWindow?.rootViewController
            // タブバーの場所を指定
            let nvc = tabbar?.children[0]
            // ナビバーのルート
            let base = nvc?.children[0]
            // PagingViewController にアクセスしてVCを取得
            let pvc = base?.children[0] as! PagingViewController
            // PageViewController のsubviewにアクセスしてスクロールの活性・非活性を指定
            for view in pvc.pageViewController.view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = isEnabled
                }
            }
    }
    
    // セクションの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 2 {
            return 3
        }
        return 1
    }
    
    // セクションの総数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
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
            
            cell.imageView.image = images[indexPath.row]
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

// StoryboardのEstimate Sizeは "None" にしておく
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch (indexPath.section) {
        case 0:
            return CGSize(width: view.frame.width - 32, height: 200)
        case 1:
            return CGSize(width: view.frame.width - 32, height: 200)
        case 2:
            return CGSize(width: view.frame.width - 32, height: images[indexPath.row]!.size.height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    // 外枠の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

//extension ViewController: PagingViewControllerDataSource {
//    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
//        return 10
//    }

//    func pagingViewController(_ pagingViewController: PagingViewController, viewControllerAt index: Int) -> UIViewController {
//        return ChildViewController(index: index)
//    }
//
//    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
//        return PagingTitleItem(title: "View \(index)", index: index)
//    }
//}

