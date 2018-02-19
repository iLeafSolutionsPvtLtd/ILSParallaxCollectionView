//
//  ItemDetailedCellCell.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//


import UIKit

class ItemDetailedCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var whiteEffectView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        isSelected = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isSelected = true
    }
    
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    override var isSelected: Bool {
        didSet {
            whiteEffectView.isHidden = isSelected
        }
    }
}
