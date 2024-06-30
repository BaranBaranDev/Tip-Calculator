//
//  CalculatorVC.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//

import UIKit
import SnapKit

final class CalculatorVC: UIViewController {
    
    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()
    
    
    private lazy var vStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [logoView,resultView,billInputView,tipInputView,splitInputView, UIView()])
        stackview.axis = .vertical
        stackview.spacing = 36
        return stackview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        layout()
    }
    
    private func drawDesign(){
        view.addSubview(vStackView)
        view.backgroundColor = ThemeColor.bg
    }
    
    
}

// MARK: - Layout
fileprivate extension CalculatorVC {
    func layout(){
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).inset(16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).inset(16)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+16)
        }
        
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        
    }
}
