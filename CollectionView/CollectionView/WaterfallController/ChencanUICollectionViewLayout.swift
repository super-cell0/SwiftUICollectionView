//
//  ChencanUICollectionViewLayout.swift
//  CollectionView
//
//  Created by beidixiaoxiong on 2022/4/18.
//

import UIKit

//AnyObject限制只能被引用类型的引用
protocol ChencanUICollectionViewLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, HeightForItemAt indexPath: IndexPath) -> CGFloat
}

class ChencanUICollectionViewLayout: UICollectionViewLayout {
    
    var columCount = 2
    var columSpacing: CGFloat = 4
    var lineSpacing: CGFloat = 4
    
    weak var delegate: ChencanUICollectionViewLayoutDelegate?
    var collectionViewContentWidth: CGFloat {
        //解包
        guard let collectionView = collectionView else { return 0}
        return collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
    }
    
    var collectionViewContentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionViewContentWidth, height: collectionViewContentHeight)
    }
    
    //所有cell的布局属性
    private var layoutAttributesArr: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView, layoutAttributesArr.isEmpty else { return }
        //cell的宽
        let itemWidth = (collectionViewContentWidth - columSpacing) / CGFloat(columCount)
        
        //var x = [0 , itemWidth + columSpacing]
        //var x = [0 , itemWidth + columSpacing,  itemWidth * 2 + columSpacing * 2]
        var x: [CGFloat] = []
        
        for column in 0..<columCount {
            x.append(itemWidth * CGFloat(column) + columSpacing * CGFloat(column))
        }
        
        var y: [CGFloat] = Array(repeating: 0, count: columCount)
        
        var column = 0
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let itemHeight = delegate?.collectionView(collectionView, HeightForItemAt: indexPath) ?? 100
            let itemFrame = CGRect(x: x[column], y: y[column], width: itemWidth, height: itemHeight)
            
            let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            layoutAttributes.frame = itemFrame
            layoutAttributesArr.append(layoutAttributes)
            collectionViewContentHeight = max(collectionViewContentHeight, itemFrame.maxY)
            //更新y数组
            y[column] = y[column] + itemHeight + lineSpacing
            //再更新column
            column = y.firstIndex(of: y.min()!)!
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributesArr: [UICollectionViewLayoutAttributes] = []
        
        for layoutAttributes in layoutAttributesArr {
            if  layoutAttributes.frame.intersects(rect) {
                visibleLayoutAttributesArr.append(layoutAttributes)
            }
        }
        return visibleLayoutAttributesArr
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return layoutAttributesArr[indexPath.item]
    }
}
