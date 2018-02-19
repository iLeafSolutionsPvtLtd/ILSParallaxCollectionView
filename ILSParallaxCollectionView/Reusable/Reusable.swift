//
//  Reusable.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//

import UIKit


public protocol ReusableView: class {}

public extension ReusableView where Self: UIView {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}


public protocol NibNameProtocol: class { }

public extension NibNameProtocol where Self: UIView {
    
    public static var nibName: String {
        return String(describing: self)
    }
}


public protocol Reusable: ReusableView, NibNameProtocol { }
