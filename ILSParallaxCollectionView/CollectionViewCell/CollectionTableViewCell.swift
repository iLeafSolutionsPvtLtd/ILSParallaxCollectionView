//
//  CollectionTableViewCell.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//


import UIKit


class CollectionTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    // life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
