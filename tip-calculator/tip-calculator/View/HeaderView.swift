//
//  HeaderView.swift
//  tip-calculator
//
//  Created by Baran Baran on 18.07.2024.
//

import UIKit

final class HeaderView: UIView {
    // MARK: - UI Elements
    private let topLabel: UILabel = {
      LabelFactory.build(
        text: nil,
        font: ThemeFont.bold(size: 18))
    }()
    
    private let bottomLabel: UILabel = {
      LabelFactory.build(
        text: nil,
        font: ThemeFont.regular(size: 16))
    }()
    
    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var stackView: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [
        topSpacerView,
        topLabel,
        bottomLabel,
        bottomSpacerView
      ])
      stackView.axis = .vertical
      stackView.alignment = .leading
      stackView.spacing = -4
      return stackView
    }()

    init() {
      super.init(frame: .zero)
      layout()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
      // MARK: - Layout
    private func layout() {
      addSubview(stackView)
      stackView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      topSpacerView.snp.makeConstraints { make in
        make.height.equalTo(bottomSpacerView)
      }
    }
    // MARK: - Configure
    public func configure(topText: String, bottomText: String) {
      topLabel.text = topText
      bottomLabel.text = bottomText
    }
}



