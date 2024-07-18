//
//  LogoView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//


import UIKit

final class LogoView: UIView {
    
    // MARK:  UI Elements
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(image: .init(named: "icCalculatorBW"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr TIP",
            attributes: [.font: ThemeFont.demibold(size: 16)]) // belirlendi
        text.addAttributes([.font: ThemeFont.demibold(size: 24)], range: NSMakeRange(3, 3)) // sonradan size artırtık ve 3. harften sonra 3 harflik uygula dedik
        label.attributedText = text
        return label
    }()
    
    private let bottomLabel: UILabel = {
        return LabelFactory.build(
            text: "Calculator",
            font: ThemeFont.demibold(size: 20),
            textAlignment: .left)
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topLabel, bottomLabel])
        stackView.axis = .vertical
        stackView.spacing = -4
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage, labelStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func layout(){
        addSubview(hStackView)
        
        hStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // labellerin bulunduğu stackview hStackView içinde olduğundan imagein yüksekliğini ayarlayarak labellerin de ayarlanmış oldu
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(logoImage.snp.width) // logoImage'ın yüksekliğini genişliğine sabitlemek, oranını korur
        }
    }
}
