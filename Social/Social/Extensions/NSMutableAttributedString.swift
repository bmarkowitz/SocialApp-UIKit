//
// NSMutableAttributedString.swift
// Social
//
// Created by Brett Markowitz on 1/13/22.
//

import UIKit

extension NSMutableAttributedString {
    static func mixedString(with boldText: String, regularText: String) -> NSMutableAttributedString {
        let boldedAttributes = [NSAttributedString.Key.font : UIFont.semiBoldPreferredFont(forTextStyle: .callout)]
        let boldedString = NSMutableAttributedString(string: boldText, attributes: boldedAttributes)

        let regularAttributes = [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .callout)]
        let regularString = NSMutableAttributedString(string: regularText, attributes: regularAttributes)

        boldedString.append(regularString)
        
        return boldedString
    }
}
