//
//  LabelFactory.swift
//  tip-calculator
//
//  Created by Baran Baran on 30.06.2024.
//

import UIKit

// Tekrar tekrar koddan kaçınmak için oluşturdum, optinal veya varsayılan değerler eklemeye ihtiyacına göre ayarla
struct LabelFactory {
    static func build(
        text: String?,
        font: UIFont,
        textAlignment: NSTextAlignment = .center,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = .label) -> UILabel {
            let label = UILabel()
            label.text = text
            label.font = font
            label.textAlignment = textAlignment
            label.backgroundColor = backgroundColor
            label.textColor = textColor
            return label
        }
}
