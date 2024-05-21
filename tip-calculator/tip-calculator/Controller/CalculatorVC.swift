//
//  CalculatorVC.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//

import UIKit
import SnapKit

final class CalculatorVC: UIViewController {
    
    private lazy var logoView = LogoView()
    private lazy var resultView = ResultView()
    private lazy var billInputView = BillInputView()
    private lazy var tipInputView = TipInputView()
    private lazy var splitInputView = SplitInputView()
    
    
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
private extension CalculatorVC {
     func layout(){
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).inset(16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).inset(16)
        }
    }
}
