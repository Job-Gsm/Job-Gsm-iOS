//
//  alert.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/09.
//

import UIKit
import SnapKit
import Then

class Alert: UIView {
    private let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    private let bodyStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private let separatorLineView = UIView().then {
        $0.backgroundColor = .gray
    }
    private let leftButton = UIButton().then {
        $0.setTitleColor(.white, for: .normal)
    }
    private let rightButton = UIButton().then {
      $0.setTitleColor(.white, for: .normal)
    }
    private let textfield1 = UITextField().then {
        $0.backgroundColor = 
    }
    init(title: String, leftButtonTitle: String = "취소", rightButtonTitle: String = "인증") {
        self.titleLabel.text = title
        self.leftButton.setTitle(leftButtonTitle, for: .normal)
        self.rightButton.setTitle(rightButtonTitle, for: .normal)
        super.init(frame: .zero)
    
        self.backgroundColor = .black.withAlphaComponent(0.3)
        self.addSubview(self.popupView)
        [self.bodyStackView, self.separatorLineView, self.leftButton, self.rightButton]
            .forEach(self.popupView.addSubview(_:))
        [self.titleLabel]
            .forEach(self.bodyStackView.addArrangedSubview(_:))
    
    self.popupView.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.centerY.equalToSuperview()
    }
    self.bodyStackView.snp.makeConstraints {
        $0.top.equalToSuperview().inset(32)
        $0.left.right.equalToSuperview().inset(24)
    }
    self.separatorLineView.snp.makeConstraints {
        $0.top.equalTo(self.bodyStackView.snp.bottom).offset(24)
        $0.left.right.equalToSuperview()
        $0.height.equalTo(1)
    }
    self.leftButton.snp.makeConstraints {
        $0.top.equalTo(self.separatorLineView.snp.bottom)
        $0.bottom.left.equalToSuperview()
        $0.width.equalToSuperview().dividedBy(2)
        $0.height.equalTo(56)
    }
    self.rightButton.snp.makeConstraints {
        $0.top.equalTo(self.separatorLineView.snp.bottom)
        $0.bottom.right.equalToSuperview()
        $0.width.equalToSuperview().dividedBy(2)
        $0.height.equalTo(56)
    }
  }
  
    required init?(coder: NSCoder) { fatalError() }
}
