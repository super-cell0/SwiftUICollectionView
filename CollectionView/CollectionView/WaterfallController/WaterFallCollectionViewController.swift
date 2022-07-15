//
//  WaterFallCollectionViewController.swift
//  CollectionView
//
//  Created by beidixiaoxiong on 2022/4/18.
//

import UIKit

private let reuseIdentifier = "waterfallCell"
private let collectionViewContentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

class WaterFallCollectionViewController: UICollectionViewController {

    let images = [
        "test","test1","test","test2","test","test","test2","test","test1","test1","test","test","test","test","test","test","test1","test2"
    ]
    
    var itemWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumLineSpacing = collectionViewContentInset.left
//        layout.minimumInteritemSpacing = collectionViewContentInset.left
//        let itemWidth = (collectionView.bounds.width - collectionViewContentInset.left * (2 + 1)) / 2
//
//        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.backgroundColor = .systemGray5
        collectionView.contentInset = collectionViewContentInset
        
        let layout = collectionView.collectionViewLayout as! ChencanUICollectionViewLayout
        itemWidth = (collectionView.bounds.width - collectionViewContentInset.left - collectionViewContentInset.right - layout.columSpacing) / CGFloat(layout.columCount)

        layout.lineSpacing = 10
        layout.delegate = self
    }
    
    @IBAction func didBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WaterfallCollectionViewCell
        
        cell.imageView.image = UIImage(named: images[indexPath.item])
        return cell
    }
}

extension WaterFallCollectionViewController: ChencanUICollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, HeightForItemAt indexPath: IndexPath) -> CGFloat {
        
        let imageSize = UIImage(named: images[indexPath.item])!.size
        let imageWidth = imageSize.width
        let imageHeight = imageSize.height
        let imageRatio = imageHeight / imageWidth
        
        //cell的宽度 * image的高宽比 + 底部label的高度和间距
        return itemWidth * imageRatio + 50
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let itemWidth = (collectionView.bounds.width - 10 * (2 + 1)) / 2
//        return CGSize(width: itemWidth, height: itemWidth)
//    }
    
}
