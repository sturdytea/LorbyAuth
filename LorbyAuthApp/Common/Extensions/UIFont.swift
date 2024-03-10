//
//  UIFont.swift
//  LorbyAuthApp
//
//  Created by Zhasmina Aitmagambetova on 07.03.2024.
//

import UIKit

extension UIFont {
    enum CustomFont: String {
        case extraBold = "MPLUS1p-ExtraBold" // Weight: 800
        case light = "MPLUS1p-Light" // Weight: 300
        case thin = "MPLUS1p-Thin" // Weight: 100
        case bold = "MPLUS1p-Bold" // Weight: 700
        case black = "MPLUS1p-Black" // Weight: 900
        case medium = "MPLUS1p-Medium" // Weight: 500
        case regular = "MPLUS1p-Regular" // Weight: 400
    }
    
    static func customFont(_ type: CustomFont, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
