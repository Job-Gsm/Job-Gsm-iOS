//
//  SignInViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/19.
//

import UIKit
import SnapKit
import Then

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    
    let Vector2 = UIImageView().then {
        $0.image = UIImage(named: "Vector2.png")
    }
    
    let background = UIView().then{
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    let textLogo = UILabel().then {
        $0.text = "Job-GSM"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 40)
    }
    let orText = UILabel().then {
        $0.text = "or"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 20)
    }
    
    lazy var idTextField = UITextField().then{
        $0.placeholder = "ID"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let idUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let idIcon = UIImageView().then {
        $0.image = UIImage(named: "idIcon.png")
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
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 15
    }
    
    lazy var forgotPwButton = UIButton().then {
        let text = NSAttributedString(string: "비밀번호를 잊으셨나요?")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.setTitleColor(UIColor.text, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(forgotPwAction), for: .touchUpInside)
    }
    
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.text, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    @objc func forgotPwAction() {
        let fvc = ForgotPwViewController()
        fvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(fvc, animated: true)
    }
    
    @objc func signUpAction() {
        let fvc = SignUpViewController()
        fvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(fvc, animated: true)
    }
    
    private func addView() {
        [Vector2,background,textLogo,idTextField,idUnderLine,idIcon,
         pwUnderLine,pwTextField,pwIcon,signInButton,forgotPwButton,orText
        ,signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Vector2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        background.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(574)
            $0.width.equalTo(318)
        }
        textLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(236)
        }
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(334)
            $0.leading.equalToSuperview().offset(99)
        }
        idUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(368)
            $0.leading.equalToSuperview().offset(70)
            $0.height.equalTo(1)
        }
        idIcon.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(334)
            $0.leading.equalToSuperview().offset(69)
        }
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idUnderLine.snp.top).offset(53)
            $0.leading.equalToSuperview().offset(99)
        }
        pwUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idUnderLine.snp.top).offset(85)
            $0.leading.equalToSuperview().offset(70)
            $0.height.equalTo(1)
        }
        pwIcon.snp.makeConstraints{
            $0.top.equalTo(idUnderLine.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(69)
        }
        signInButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.top).offset(81)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
        forgotPwButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.top).offset(29)
        }
        orText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signInButton.snp.bottom).offset(14)
        }
        signUpButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(orText.snp.bottom).offset(9)
        }
    }
}
