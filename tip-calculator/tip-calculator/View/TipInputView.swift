//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//


import UIKit

final class TipInputView: UIView {
    
    // MARK: - UI Elements
    
    
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}


