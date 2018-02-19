

# ILSCloudKitManager

This Xcode project shows how to add a parallax Header view to a UITableView with horizontally scrollable UICollectionview for selecting images.


## Preview
<img src="./Asset/Screenshot.png?raw=false">


## Requirements
The requires Xcode 8 and Swift 3.0 to run.


## Usage
To add parallax header to scroll view (UITableView) you need just create view and set it to your scroll view (UITableView).

```swift
  //create view as header view    
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
```


## Author
iLeaf Solutions
 [http://www.ileafsolutions.com](http://www.ileafsolutions.com)


## License

    MIT License

	Copyright (c) 2018 iLeaf Solutions Pvt. Ltd.

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

    

