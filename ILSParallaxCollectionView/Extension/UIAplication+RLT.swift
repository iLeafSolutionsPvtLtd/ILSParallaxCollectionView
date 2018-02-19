//
//  UIAplication+RLT.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//
import UIKit


extension UIApplication {
    
    static var isRTL: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft
    }
}

