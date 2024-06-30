//
//  LogoView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//


import UIKit

final class LogoView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(image: .init(named: "icCalculatorBW"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr TIP",
            attributes: [.font: ThemeFont.demibold(size: 16)])
        text.addAttributes([.font: ThemeFont.demibold(size: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()
    
    
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}




