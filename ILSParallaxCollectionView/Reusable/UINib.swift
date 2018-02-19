//
//  UINib.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//

import UIKit


extension UINib {
    
    class func loadIfExists(nibName name: String, bundle: Bundle) -> UINib? {
        if bundle.path(forResource: name, ofType: "nib") == nil {
            return nil
        } else {
            return UINib(nibName: name, bundle: bundle)
        }
    }
}
