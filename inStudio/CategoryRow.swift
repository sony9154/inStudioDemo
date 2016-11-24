//
//  CategoryRow.swift
//  inStudio
//
//  Created by Peter.Hsu on 2016/11/22.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

import UIKit

class CategoryRow: UITableViewCell {
    
    var categoryName:String? = nil
    var showDetailDelegate:ShowDetailDelegate? = nil
    var imageDatas: [Data] = []
    @IBOutlet weak var collectionView: UICollectionView!

}

extension CategoryRow : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCell
        if imageDatas.count > indexPath.row {
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(data: imageDatas[indexPath.row])
        }

        cell.categoryName = categoryName
        return cell
    }
    
    
}

extension CategoryRow : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension CategoryRow : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? VideoCell {
            let displayText = "selected cell number: \(indexPath.row) from category: \(selectedCell.categoryName)"
            showDetailDelegate?.showDetail(displayText)
            //            print("selected cell from category: \(selectedCell.categoryName)")
        }
    }
    
}

















