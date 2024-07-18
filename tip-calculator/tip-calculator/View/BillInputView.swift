//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.05.2024.
//


import UIKit

final class BillInputView: UIView {
    
    // MARK: - UI Elements
    
    private let headerView: UIView = {
        let view = HeaderView()
        view.configure(topText: "Enter", bottomText: "your bill")
        return view
    }()
    
    
    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8.0)
        return view
    }()
    
    
    private let currencyDenominationLabel: UILabel = {
        let label = LabelFactory.build(
            text: "$",
            font: ThemeFont.bold(size: 24))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = ThemeFont.demibold(size: 28)
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.tintColor = .label
        textField.textColor = .label
        textField.accessibilityIdentifier = ""
        // Add toolbar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        return textField
    }()
    
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    
    
    // MARK: - Actions
    
    @objc fileprivate func doneButtonTapped() {
        textField.endEditing(true)
    }
    
    
    // MARK: - Layout
    
    private func layout() {
        [headerView, textFieldContainerView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyDenominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }
}

