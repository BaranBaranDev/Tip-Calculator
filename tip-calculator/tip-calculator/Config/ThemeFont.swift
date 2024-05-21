//
//  ThemeFont.swift
//  tip-calculator
//
//  Created by Baran Baran on 21.05.2024.
//

import UIKit

struct ThemeFont {
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demibold(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Demibold", size: size) ?? .systemFont(ofSize: size)
    }
}
