//
//  SmallGiftCardCollectionViewDataSource.swift
//  WiredBrainCoffee
//
//  Created by Camilla Cidral on 18/07/22.
//  Copyright © 2022 Mark Moeykens. All rights reserved.
//

import UIKit

class SmallGiftCardCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate var giftCards = [GiftCardModel]()
    
    init (giftCards: [GiftCardModel]) {
        self.giftCards = giftCards
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: giftCards[indexPath.item])
        //as! ColorCollectionViewCell
        //        let backgroundColor = seasonalGiftCards[indexPath.section][indexPath.item]
        //        cell.setup(backgroundColor: backgroundColor, cellNumber: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        return CGSize (width: width, height: height)
    }
}
