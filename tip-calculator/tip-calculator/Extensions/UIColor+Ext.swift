//
//  UIColor+Ext.swift
//  tip-calculator
//
//  Created by Baran Baran on 21.05.2024.
//

import UIKit

extension UIColor {
    // Hex string ile UIColor oluşturmak için convenience initializer
    convenience init?(hex: String) {
        // Girdiyi temizle (boşluk ve hash sembollerini kaldır)
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Başta hash sembolü varsa kaldır
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        // Hex string'in geçerli uzunlukta olup olmadığını kontrol et (6 veya 8 karakter)
        guard hexSanitized.count == 6 || hexSanitized.count == 8 else {
            return nil
        }
        
        // Eğer hex string alpha değeri içermiyorsa, varsayılan olarak ekle (FF, yani tamamen opak)
        if hexSanitized.count == 6 {
            hexSanitized = "FF" + hexSanitized
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)
        
        // Renk bileşenlerini hex string'den ayıkla
        let alpha = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
        let red = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x000000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // UIColor'ı hex string'e dönüştürmek için yardımcı method
    func toHex(alpha: Bool = true) -> String? {
        // UIColor bileşenlerini cgColor'dan al
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alphaComponent = components.count >= 4 ? components[3] : 1.0
        
        // Alpha bileşeni dahil edilip edilmeyeceğine göre string formatla
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
