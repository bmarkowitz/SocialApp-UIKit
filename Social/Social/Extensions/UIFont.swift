//
// UIFont.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import UIKit

extension UIFont {
    static func boldPreferredFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        let systemFont = UIFont.preferredFont(forTextStyle: style)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.default) {
            font = UIFont.boldSystemFont(ofSize: descriptor.pointSize)
        } else {
            font = systemFont
        }
        return font
    }
    
    static func semiBoldPreferredFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        let systemFont = UIFont.preferredFont(forTextStyle: style)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.default) {
            font = UIFont.boldSystemFont(ofSize: descriptor.pointSize)
        } else {
            font = systemFont
        }
        return font
    }
}
