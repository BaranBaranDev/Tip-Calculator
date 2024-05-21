//
//  ThemeColor.swift
//  tip-calculator
//
//  Created by Baran Baran on 21.05.2024.
//

import UIKit

struct ThemeColor {
    // Arka plan rengi (background color) - Açık gri/beyaz
    static let bg = UIColor(hex: "F5F3F4")
    
    // Birincil renk (primary color) - Canlı turkuaz/mavi tonunda
    static let primary = UIColor(hex: "1CC9BE")
    
    // İkincil renk (secondary color) - Sistem turuncu rengi, iOS tarafından sağlanır
    static let secondary = UIColor.systemOrange
    
    // Metin rengi (text color) - Siyah
    static let text = UIColor(hex: "000000")
    
    // Ayırıcı çizgi rengi (separator color) - Açık gri
    static let separator = UIColor(hex: "CCCCCC")
}
