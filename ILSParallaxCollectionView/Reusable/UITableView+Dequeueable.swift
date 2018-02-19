//
//  UITableView+Dequeueable.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//

import UIKit


public extension UITableView {
    
    //MARK: headers
    
    func register<T: UIView>(_: T.Type) where T: Reusable {
        if let nib = UINib.loadIfExists(nibName: T.nibName, bundle: Bundle.main) {
            register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueHeaderFooterView<T: UIView>() -> T where T: Reusable {
        register(T.self)
        
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
    
    //MARK: cells
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = UINib.loadIfExists(nibName: T.nibName, bundle: Bundle.main) {
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeue<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        register(T.self)
        
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}



