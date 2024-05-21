//
//  LogoView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//


import UIKit

final class LogoView: UIView {
    
    // MARK: - UI Elements
    
    
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}




