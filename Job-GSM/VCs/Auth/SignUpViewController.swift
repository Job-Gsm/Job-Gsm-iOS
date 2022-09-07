//
//  SignUpViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/19.
//

import UIKit
import SnapKit
import Then
import Moya

class SignUpViewController: UIViewController {
    
    var essentialFieldList = [UITextField]()
    
    private let authProvider = MoyaProvider<LoginServices>(plugins: [NetworkLoggerPlugin()])
    var userData: SignupModel?
    

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        addView()
        setLayout()
        essentialFieldList = [emailTextField,pwcheckTextField,pwTextField,nicknameTextField]

    }
    
    func isFilled(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        return true
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
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 4, spread: 0)
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
        $0.isSecureTextEntry = true 
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
        $0.isSecureTextEntry = true
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let pwcheckUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let pwcheckIcon = UIImageView().then {
        $0.image = UIImage(named: "pwIcon.png")
    }
    
    lazy var nicknameTextField = UITextField().then{
        $0.placeholder = "nickname"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let nicknameUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let nicknameIcon = UIImageView().then {
        $0.image = UIImage(named: "idIcon.png")
    }
    
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    @objc func signUpAction() {
        for field in essentialFieldList {
            if !isFilled(field) {
                wrong()
            }
        }
        signUp()
        self.navigationController?.popViewController(animated: true)
    }
    
    func wrong() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        nicknameTextField.attributedPlaceholder = NSAttributedString(string: "nickname", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwcheckTextField.attributedPlaceholder = NSAttributedString(string: "password check", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        emailUnderLine.backgroundColor = .wrong
        nicknameUnderLine.backgroundColor = .wrong
        pwcheckUnderLine.backgroundColor = .wrong
        pwUnderLine.backgroundColor = .wrong
    }
    private func addView() {
        [vector2,background,emailUnderLine,emailTextField,emailIcon,textLogo
        ,pwTextField,pwUnderLine,pwIcon,pwcheckUnderLine,pwcheckIcon,pwcheckTextField
        ,nicknameUnderLine,nicknameIcon,nicknameTextField,signUpButton].forEach {
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
        nicknameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwcheckUnderLine.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(110)
        }
        nicknameUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwcheckUnderLine.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(76)
            $0.height.equalTo(1)
        }
        nicknameIcon.snp.makeConstraints{
            $0.top.equalTo(pwcheckUnderLine.snp.top).offset(21)
            $0.leading.equalToSuperview().offset(78)
        }
        signUpButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nicknameUnderLine.snp.bottom).offset(80)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
    
}

extension SignUpViewController {
    func signUp() {
        let param = SignupRequest.init(self.emailTextField.text!, self.pwTextField.text!, self.nicknameTextField.text!)
        print(param)
        authProvider.request(.signUp(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    let str = try result.mapJSON()
                    print(str)
                    self.userData = try result.map(SignupModel.self)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
