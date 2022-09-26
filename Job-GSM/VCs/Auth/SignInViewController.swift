//
//  SignInViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/19.
//

import UIKit
import SnapKit
import Then
import Moya

class SignInViewController: UIViewController {
    private let bounds = UIScreen.main.bounds
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    var essentialFieldList = [UITextField]()
    
    private let authProvider = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin()])
    var userData: SigninModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        essentialFieldList = [emailTextField,pwTextField]
    }
    
    func isFilled(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        return true
    } 
    
    let Vector2 = UIImageView().then {
        $0.image = UIImage(named: "Vector2.png")
    }
    
    let wrongtext = UILabel().then{
        $0.text = "아이디 혹은 비밀번호가 일치하지 않습니다"
        $0.textColor = .white
        $0.font = UIFont(name: "Kreon-Regular", size: 13)
    }
    
    let background = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 4, spread: 0)
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

    let emailIcon = UIImageView().then {
        $0.image = UIImage(named: "idIcon.png")
    }
    
    lazy var emailTextField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "아이디을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    
    let pwIcon = UIImageView().then {
        $0.image = UIImage(named: "pwIcon.png")
    }
    
    lazy var pwTextField = UITextField().then{
        $0.placeholder = "password"
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
        $0.isSecureTextEntry = true
    }
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(LoginAction), for: .touchUpInside)
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
    @objc func LoginAction() {
        signin()
    }
    @objc func forgotPwAction() {
        let fvc = ForgotPwViewController()
        fvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(fvc, animated: true)
    }
    
    @objc func signUpAction() {
        let suvc = SignUpViewController()
        suvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    private func addView() {
        [Vector2,background,textLogo,wrongtext,emailIcon,emailTextField,
         pwIcon,pwTextField,forgotPwButton,signInButton,orText,signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Vector2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        background.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo((bounds.height) / 1.47)
            $0.width.equalTo((bounds.width) / 1.22)
        }
        textLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(background.snp.top).offset((bounds.height) / 8.35)
        }
        wrongtext.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLogo.snp.top).offset((bounds.height) / 14.3)
        }
        emailIcon.snp.makeConstraints{
            $0.top.equalTo(textLogo.snp.bottom).offset((bounds.height) / 14.80)
            $0.leading.equalTo(background.snp.leading).offset(12)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(textLogo.snp.bottom).offset((bounds.height) / 17.95)
            $0.leading.equalTo(emailIcon.snp.trailing).offset(7)
            $0.trailing.equalTo(background.snp.trailing).inset(22)
            $0.height.equalTo((bounds.height) / 19.18)
        }
        pwIcon.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(36)
            $0.leading.equalTo(background.snp.leading).offset(12)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(26)
            $0.leading.equalTo(pwIcon.snp.trailing).offset(7)
            $0.trailing.equalTo(background.snp.trailing).inset(22)
            $0.height.equalTo((bounds.height) / 19.18)
        }
        forgotPwButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwTextField.snp.bottom).offset(37)
        }
        signInButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(forgotPwButton.snp.bottom).offset(34)
            $0.height.equalTo((bounds.height) / 16.88)
            $0.width.equalTo((bounds.width) / 1.95)
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


extension SignInViewController {
    
    func success() {
        let mvc = MainViewController()
        mvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(mvc, animated: true, completion: nil)
    }
    func faliure() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        wrongtext.textColor = .wrong
    }
    func signin() {
        let param = SigninRequest.init(self.emailTextField.text!, self.pwTextField.text!)
        print(param)
        authProvider.request(.signIn(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    self.userData = try result.map(SigninModel.self)
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
