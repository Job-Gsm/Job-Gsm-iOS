//
//  ForgotPwViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/20.
//

import UIKit
import SnapKit
import Then
import Moya

class ForgotPwViewController: BaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    private let authProvider = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin()])
    var userData: SendEmailModel?
    var newUserData: ForgotPWModel?
    private let bounds = UIScreen.main.bounds

    
    func isFilled(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        return true
    }
    
    let certificationWrong = UILabel().then {
        $0.text = "유효하지않은 인증번호입니다."
        $0.font = UIFont(name: "Kreon-Regular", size: 12)
        $0.textColor = .wrong
    }
    
    let vector2 = UIImageView().then {
        $0.image = UIImage(named: "Vector2.png")
    }
        
    let background = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 4, spread: 0)
    }
    
    let forgotMyPw = UILabel().then{
        $0.text = "비밀번호를 잊어버렸나요?"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 25)
    }
    
    lazy var enterEmailField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "email 주소를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    lazy var newPwField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "새 비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    lazy var againPwField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "새 비밀번호를 다시 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    
    lazy var certificationButton = UIButton().then{
        let text = NSAttributedString(string: "인증")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(showModal), for: .touchUpInside)
    }
    
    lazy var changeButton = UIButton().then{
        let text = NSAttributedString(string: "변경하기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    let pwText = UILabel().then{
        $0.text = "비밀번호가 기억나셨나요?"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 14)
    }
    lazy var backLoginButton = UIButton().then {
        let text = NSAttributedString(string: "로그인으로 돌아가기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 14)
        $0.setTitleColor(UIColor.text, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(backLogin), for: .touchUpInside)
    }
    @objc func backLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func showModal() {
        sendEmail()
    }
    
    
    override func addView() {
        [vector2,background,forgotMyPw,enterEmailField,newPwField,againPwField,changeButton,certificationButton,backLoginButton,pwText, certificationWrong].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        vector2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        background.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.height.equalTo((bounds.width - 72) * 1.27)
        }
        forgotMyPw.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(background.snp.top).offset(30)
        }
        enterEmailField.snp.makeConstraints{
            $0.top.equalTo(forgotMyPw.snp.bottom).offset(31)
            $0.height.equalTo((bounds.height) / 19.18)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.72)
            $0.trailing.equalToSuperview().inset((bounds.width) / 3.12)
        }
        certificationButton.snp.makeConstraints {
            $0.top.equalTo(forgotMyPw.snp.bottom).offset(31)
            $0.height.equalTo((bounds.height) / 19.18)
            $0.leading.equalTo(enterEmailField.snp.trailing).offset(7)
            $0.trailing.equalToSuperview().inset((bounds.width) / 6.72)
        }
        newPwField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(enterEmailField.snp.bottom).offset(14)
            $0.height.equalTo((bounds.height) / 19.18)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.72)
        }
        againPwField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(newPwField.snp.bottom).offset(14)
            $0.height.equalTo((bounds.height) / 19.18)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.72)
        }
        changeButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(againPwField.snp.bottom).offset(10)
            $0.height.equalTo((bounds.height) / 16.88)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.72)
        }
        backLoginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeButton.snp.bottom).offset((bounds.height) / 22.21)
        }
        pwText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeButton.snp.bottom).offset(10)
        }
    }
}


extension ForgotPwViewController {
    func success() {
        let MVC = ModalViewController()
        present(MVC, animated: true, completion: nil)
    }
    
    func faliure() {
        enterEmailField.layer.borderWidth = 2
        enterEmailField.layer.borderColor = UIColor.wrong?.cgColor
        enterEmailField.text = ""
        enterEmailField.attributedPlaceholder = NSAttributedString(string: "이메일을 다시 확인해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
    }
    
    func sendEmail() {
        let param = SendEmailRequest.init(self.enterEmailField.text!)
        print(param)
        authProvider.request(.sendEmail(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    let str = try result.mapJSON()
                    print(str)
                    self.userData = try result.map(SendEmailModel.self)
                } catch(let err) {
                    print(err.localizedDescription)
                }
                let statusCode = result.statusCode
                switch statusCode {
                case 200..<300:
                    print("success")
                    self.success()
                default:
                    print("failure")
                    self.faliure()
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func forgotPW() {
        let param = ForgotRequest.init(self.enterEmailField.text!, self.newPwField.text!)
        print(param)
        authProvider.request(.forgotPW(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    let str = try result.mapJSON()
                    print(str)
                    self.newUserData = try result.map(ForgotPWModel.self)
                } catch(let err) {
                    print(err.localizedDescription)
                }
                let statusCode = result.statusCode
                switch statusCode {
                case 200..<300:
                    print("success")
                    self.success()
                default:
                    print("failure")
                    self.faliure()
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

