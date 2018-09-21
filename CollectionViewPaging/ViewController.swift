//
//  ViewController.swift
//  CollectionViewPaging
//
//  Created by Soemsak on 21/9/2561 BE.
//  Copyright © 2561 Soemsak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "Cell"
    var numberCell = 22
    var spaceNumber:CGFloat = 1
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? ItemCollectionViewCell
        cell?.numberLabel.text = "\(indexPath.row)"
        if indexPath.row == numberCell - 1 {
            numberCell += 3
            collectionView.reloadData()
        }
        return cell!
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    //MARK:- UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.size.width , height: collectionView.bounds.size.width)
        } else {
            var sizeCell = collectionView.bounds.size.width/3 - spaceNumber
            sizeCell = sizeCell+1
            return CGSize(width: Int(sizeCell), height: Int(sizeCell))
        }
    }

}

