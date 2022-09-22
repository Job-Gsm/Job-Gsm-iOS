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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    var essentialFieldList = [UITextField]()
    private let bounds = UIScreen.main.bounds
    private let authProvider = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin()])
    var userData: SignupModel?
    var certificationData: CertificationModel?
    

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        addView()
        setLayout()
        essentialFieldList = [emailTextField,pwcheckTextField,pwTextField]

    }
    
    func isFilled(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        return true
    }
    let textLogo = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 25)
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
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
        
    }
    lazy var pwTextField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    lazy var pwcheckTextField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 다시 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder!.cgColor])
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
        $0.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: "인증번호를 입력하세요", message: nil, preferredStyle: .alert)
        alert.addTextField { (certificationTextField) in
            certificationTextField.placeholder = "인증번호를 입력하세요(5자리)"
            certificationTextField.textAlignment = .center
        }
        let action = UIAlertAction(title: "인증하기", style: .default) { _ in
            self.certification()
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "다음")
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
    lazy var certificationTextField = UITextField()
    
    func wrong() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
        pwcheckTextField.attributedPlaceholder = NSAttributedString(string: "password check", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderwrong!])
    }
    private func addView() {
        [vector2,background,emailTextField,textLogo,pwTextField,pwcheckTextField,signUpButton,certificationButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        vector2.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        background.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.height.equalTo((bounds.width - 72) * 1.27)
        }
        textLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(background.snp.top).offset(30)
        }
        emailTextField.snp.makeConstraints {
            $0.leading.equalTo(background.snp.leading).offset(22)
            $0.trailing.equalTo(view.snp.trailing).inset((bounds.width) / 3.12)
            $0.top.equalTo(textLogo.snp.bottom).offset((bounds.height) / 16)
            $0.height.equalTo((bounds.height) / 19.181)
        }
        certificationButton.snp.makeConstraints{
            $0.top.equalTo(textLogo.snp.bottom).offset((bounds.height) / 16)
            $0.height.equalTo((bounds.height) / 19.181)
            $0.leading.equalTo(emailTextField.snp.trailing).offset(14)
            $0.trailing.equalTo(background.snp.trailing).offset(-21)
        }
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(background.snp.leading).offset(22)
            $0.trailing.equalTo(background.snp.trailing).offset(-21)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.height.equalTo((bounds.height) / 19.181)
        }
        pwcheckTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(background.snp.leading).offset(22)
            $0.trailing.equalTo(background.snp.trailing).offset(-21)
            $0.top.equalTo(pwTextField.snp.bottom).offset(10)
            $0.height.equalTo((bounds.height) / 19.181)
        }
        signUpButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwcheckTextField.snp.bottom).offset(66)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
    
}

extension SignUpViewController {
    func certification() {
        let param = CertificationRequest.init(self.certificationTextField.text!)
        print(param)
        authProvider.request(.certification(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    let str = try result.mapJSON()
                    print(str)
                    self.certificationData = try result.map(CertificationModel.self)
                } catch(let err) {
                    print(err.localizedDescription)
                }
                let statusCode = result.statusCode
                switch statusCode {
                case 200..<300:
                    print("success")
                    //self.success()
                default:
                    print("failure")
                    //self.faliure()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    func signUp() {
        let param = SignupRequest.init(self.emailTextField.text!, self.pwTextField.text!)
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
