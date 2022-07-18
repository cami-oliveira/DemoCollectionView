//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Camilla Cidral on 06/07/22.
//  Copyright © 2022 Mark Moeykens. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 15.0, *)
class GiftViewController: UIViewController {
    
    
    
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thankyouHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    @IBOutlet weak var thankyouCollectionView: UICollectionView!
    var seasonalGiftCards = [GiftCardModel]()
    var thankyouDataSource: SmallGiftCardCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self]
            (cards) in
            guard let self = self else { return }
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.thankyouDataSource = SmallGiftCardCollectionViewDataSource (giftCards: cards)
            self.thankyouCollectionView.dataSource = self.thankyouDataSource
            self.thankyouCollectionView.delegate = self.thankyouDataSource
            self.thankyouCollectionView.reloadData()
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setHeightOfCollectionViews()
    }
    
    func setHeightOfCollectionViews() {
        let width = seasonalCollectionView.bounds.width - 30
        let height = width / 1.5
        seasonalHeightConstraint.constant = height
        
        thankyouHeightConstraint.constant = height / 2
    }
}

@available(iOS 15.0, *)
extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return seasonalGiftCards.count
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: seasonalGiftCards[indexPath.item])
        //as! ColorCollectionViewCell
        //        let backgroundColor = seasonalGiftCards[indexPath.section][indexPath.item]
        //        cell.setup(backgroundColor: backgroundColor, cellNumber: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2 - 50
        let height = width / 1.5
        return CGSize (width: width, height: height)
    }
}
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
////        if kind == UICollectionView.elementKindSectionHeader {
////
//            let view = collectionView.dequeueReusableSupplementaryView(
//                ofKind: UICollectionView.elementKindSectionHeader,
//                withReuseIdentifier: "sectionHeader", for: indexPath)
//            //as! HeaderCollectionReusableView
//
//            //view.setup(count: seasonalGiftCards[indexPath].count)
//            //return view
////        } else {
////            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionFooter", for: indexPath)
////            view.backgroundColor = UIColor.purple
//            return view
        
  //  }

