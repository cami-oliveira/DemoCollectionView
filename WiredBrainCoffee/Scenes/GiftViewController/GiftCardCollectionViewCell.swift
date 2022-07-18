//
//  GiftCardCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Camilla Cidral on 18/07/22.
//  Copyright © 2022 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var giftCardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        giftCardImageView.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
        clipsToBounds = true
        
    }
    
    func setup(giftCardModel: GiftCardModel) {
        giftCardImageView.image = giftCardModel.image
    }
}
