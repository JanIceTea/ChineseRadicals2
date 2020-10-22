//
//  OverViewCollectionViewCell.swift
//  Chinese Radicals
//
//  Created by Jan Trutzschler on 12/10/2018.
//  Copyright © 2018 teatracks. All rights reserved.
//

import Foundation
import UIKit

//https://stackoverflow.com/questions/24857986/load-a-uiview-from-nib-in-swift/26018312
protocol XibLoadable {
    associatedtype CustomViewType
    static func loadFromXib() -> CustomViewType
    static func nib() -> UINib
}

extension XibLoadable where Self: UIView {
    
    static func nib() -> UINib {
        return UINib(nibName: "\(self)", bundle: Bundle.main)
    }
    
    static func loadFromXib() -> Self {
        let nib = UINib(nibName: "\(self)", bundle: Bundle.main)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? Self else {
            // your app should crash if the xib doesn't exist
            preconditionFailure("Couldn't load xib for view: \(self)")
        }
        return customView
    }
}

class OverViewBackgroundView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
    }
}

class OverViewCollectionViewCell: UICollectionViewCell, XibLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "OverViewCollectionViewCell"
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
