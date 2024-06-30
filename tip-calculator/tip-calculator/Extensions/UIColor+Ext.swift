//
//  UIColor+Ext.swift
//  tip-calculator
//
//  Created by Baran Baran on 21.05.2024.
//

import UIKit

// Hex dönüştürücü
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        guard hexSanitized.count == 6 || hexSanitized.count == 8 else {
            return nil
        }
        
        if hexSanitized.count == 6 {
            hexSanitized = "FF" + hexSanitized
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)
        
        let alpha = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
        let red = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x000000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func toHex(alpha: Bool = true) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alphaComponent = components.count >= 4 ? components[3] : 1.0
        
      
        if alpha {
            return String(format: "#%02lX%02lX%02lX%02lX",
                          lroundf(Float(alphaComponent * 255)),
                          lroundf(Float(red * 255)),
                          lroundf(Float(green * 255)),
                          lroundf(Float(blue * 255)))
        } else {
            return String(format: "#%02lX%02lX%02lX",
                          lroundf(Float(red * 255)),
                          lroundf(Float(green * 255)),
                          lroundf(Float(blue * 255)))
        }
    }
}
