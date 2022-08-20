//
//  SignUpViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/19.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        addView()
        setLayout()

    }
    let textLogo = UILabel().then {
        $0.text = "Job-GSM"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 40)
    }
    let vector2 = UIImageView().then {
        $0.image = UIImage(named: "Vector2.png")
    }

    let background = UIView().then{
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    lazy var emailTextField = UITextField().then{
        $0.placeholder = "email"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let emailUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let emailIcon = UIImageView().then {
        $0.image = UIImage(named: "emailIcon.png")
    }
    
    lazy var pwTextField = UITextField().then{
        $0.placeholder = "password"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let pwUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let pwIcon = UIImageView().then {
        $0.image = UIImage(named: "pwIcon.png")
    }
    
    lazy var pwcheckTextField = UITextField().then{
        $0.placeholder = "password check"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let pwcheckUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let pwcheckIcon = UIImageView().then {
        $0.image = UIImage(named: "pwIcon.png")
    }
    
    private func addView() {
        [vector2,background,emailUnderLine,emailTextField,emailIcon,textLogo
        ,pwTextField,pwUnderLine,pwIcon,pwcheckUnderLine,pwcheckIcon,pwcheckTextField].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        vector2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        background.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(574)
            $0.width.equalTo(318)
        }
        textLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(171)
        }
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(269)
            $0.leading.equalToSuperview().offset(110)
        }
        emailUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(300)
            $0.leading.equalToSuperview().offset(76)
            $0.height.equalTo(1)
        }
        emailIcon.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(272)
            $0.leading.equalToSuperview().offset(78)
        }
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailUnderLine.snp.top).offset(21)
            $0.leading.equalToSuperview().offset(110)
        }
        pwUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailUnderLine.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(76)
            $0.height.equalTo(1)
        }
        pwIcon.snp.makeConstraints{
            $0.top.equalTo(emailUnderLine.snp.top).offset(22)
            $0.leading.equalToSuperview().offset(78)
        }
        pwcheckTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.top).offset(18)
            $0.leading.equalToSuperview().offset(110)
        }
        pwcheckUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(76)
            $0.height.equalTo(1)
        }
        pwcheckIcon.snp.makeConstraints{
            $0.top.equalTo(pwUnderLine.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(78)
        }
    }
    
}
