//
//  ViewController.swift
//  CollectionView
//
//  Created by beidixiaoxiong on 2022/4/18.
//

import UIKit

//struct AllImage {
//    let image: String
//}
//
//let images: [AllImage] = [
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//    AllImage(image: "test"),
//
//]

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images = [
    ["test","test","test","test","test","test","test","test","test"],
    ["test","test","test","test","test","test","test","test","test"]
    ]
    private let sectionHeaderTexts = ["chencan", "beidixiaoxiong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionHeaderTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: images[indexPath.section][indexPath.item])
        
        return cell
    }
    
    //Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
//        if kind == UICollectionView.elementKindSectionHeader {
//            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! HeaderCollectionReusableView
//            
//            sectionHeader.textLabel.text = sectionHeaderTexts[indexPath.section]
//            
//            return sectionHeader
//        } else {
//            //return UICollectionReusableView()
//            fatalError("no footer")
//        }
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! HeaderCollectionReusableView
            
            sectionHeader.textLabel.text = sectionHeaderTexts[indexPath.section]
            
            return sectionHeader
        default:
            //fatalError("no footer")
            //break
            return UICollectionReusableView()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.bounds.width - 20 - 5 * 2) / 3
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
