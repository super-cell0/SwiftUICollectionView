//
//  WaterfallCollectionViewCell.swift
//  CollectionView
//
//  Created by beidixiaoxiong on 2022/4/18.
//

import UIKit

class WaterfallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var waterfallContentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        waterfallContentView.layer.cornerRadius = 5
    }
}
