//
//  ViewController.swift
//  ILSParallaxCollectionView
//
//  Created by Hiran on 2/19/18.
//  Copyright © 2018 iLeaf Solutions pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private (set) var collectionParallaxView: UICollectionView!
    private (set) var headerBuilder = ImageHeaderDataSourse()
    private (set) var sliderBuilder = ImagesDataSourse()
    
    private let sliderHeight: CGFloat = 100
    private let sliderPadding: CGFloat = 50

    
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "CollectionTableViewCell")
        
        setupParallaxHeader()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupParallaxHeader() {
        //height for header without navigation bar & tab bar
        //& first cell with horizontal slider
        let parallaxHeight: CGFloat = view.bounds.height - (sliderHeight + sliderPadding)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionParallaxView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: parallaxHeight),
            collectionViewLayout: layout
        )
        collectionParallaxView.isPagingEnabled = true
        collectionParallaxView.showsHorizontalScrollIndicator = false
        collectionParallaxView.backgroundColor = UIColor.white
        headerBuilder.setup(
            collectionView: collectionParallaxView,
            images: images,
            handler: { [weak self] selectedIndexPath in
                self?.sliderBuilder.selectCell(forIndexPath: selectedIndexPath)
        })
        tableView.parallaxHeader.view = collectionParallaxView
        tableView.parallaxHeader.height = parallaxHeight
        tableView.parallaxHeader.minimumHeight = 0
        tableView.parallaxHeader.mode = .centerFill
        tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            print(parallaxHeader.progress)
        }
    }
    
    
    //MARK: table view data source/delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return sliderHeight
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeue(forIndexPath: indexPath) as CollectionTableViewCell
            
            sliderBuilder.setup(
                collectionView: cell.collectionView,
                images: images,
                handler: { [weak self] selectedIndexPath in
                    self?.headerBuilder.selectCell(forIndexPath: selectedIndexPath)
                }
            )
            
            return cell
        }
        
        let cell = tableView.dequeue(forIndexPath: indexPath) as TableViewCell
        cell.lblTitle?.text = "Row: \(indexPath.row)"
        return cell
    }
    
    private func height(for indexPath: IndexPath) -> CGFloat {
        return CGFloat(indexPath.row * 20 + 20)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.parallaxHeader.height = height(for: indexPath)
    }
    
}

