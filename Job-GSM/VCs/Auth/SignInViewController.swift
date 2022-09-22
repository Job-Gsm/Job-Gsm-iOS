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

    lazy var emailTextField = UITextField().then{
        $0.placeholder = "ID"
//        $0.addTarget(self, action: #selector(), for: .editingChanged)
    }
    let emailUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    let emailIcon = UIImageView().then {
        $0.image = UIImage(named: "idIcon.png")
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
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
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
    
    @objc func signInAction() {
        signin()
    }
    
    private func addView() {
        [Vector2,background,textLogo,emailTextField,emailUnderLine,emailIcon,
         pwUnderLine,pwTextField,pwIcon,signInButton,forgotPwButton,orText
        ,signUpButton, wrongtext].forEach {
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
        wrongtext.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(295)
        }
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(334)
            $0.leading.equalToSuperview().offset(99)
        }
        emailUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(368)
            $0.leading.equalToSuperview().offset(70)
            $0.height.equalTo(1)
        }
        emailIcon.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(334)
            $0.leading.equalToSuperview().offset(69)
        }
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailUnderLine.snp.top).offset(53)
            $0.leading.equalToSuperview().offset(99)
        }
        pwUnderLine.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailUnderLine.snp.top).offset(85)
            $0.leading.equalToSuperview().offset(70)
            $0.height.equalTo(1)
        }
        pwIcon.snp.makeConstraints{
            $0.top.equalTo(emailUnderLine.snp.top).offset(54)
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

extension SignInViewController {
    
    func success() {
        let mvc = MainViewController()
        mvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(mvc, animated: true, completion: nil)
    }
    func faliure() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        emailUnderLine.backgroundColor = .wrong
        pwUnderLine.backgroundColor = .wrong
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
