//
//  ModalViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/21.
//

import UIKit
import Moya
import SnapKit
import Then
import DPOTPView

class ModalViewController: UIViewController {
    
    private let authProvider = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin()])
    var userData: CertificationModel?

    private let bounds = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setLayout()
    }
    
    let wrongtext = UILabel().then {
        $0.text = "인증번호를 확인해주세요"
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.textColor = .white
    }
    
    let backView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    let text = UILabel().then{
        $0.text = "인증번호를 입력해주세요"
        $0.font = UIFont(name: "Kreon-Regular", size: 25)
    }
    
    let textfield = DPOTPView().then {
        $0.isCursorHidden = true
        $0.count = 5
        $0.spacing = 10
        $0.cornerRadiusTextField = 10
        $0.dismissOnLastEntry = true
        $0.fontTextField = UIFont(name: "Kreon-Regular", size: 15)!
        $0.backGroundColorTextField = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 0.7)
        $0.textColorTextField = .white
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    
    lazy var certificationButton = UIButton().then {
        let text = NSAttributedString(string: "인증")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(certificationAction), for: .touchUpInside)
    }
    lazy var backButton = UIButton().then {
        let text = NSAttributedString(string: "취소")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 18)
        $0.setTitleColor(UIColor.text, for: .normal)
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.button!.cgColor
        $0.layer.cornerRadius = 10
    }
    
    @objc func certificationAction() {
        certification()
    }
    
    private func addView() {
        [backView, text, textfield, certificationButton, backButton, wrongtext].forEach {
            view.addSubview($0)
        }
    }
    private func setLayout() {
        backView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 1.8)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        textfield.snp.makeConstraints{
            $0.top.equalTo(backView.snp.top).offset((bounds.height) / 6)
            $0.leading.trailing.equalToSuperview().inset((bounds.width) / 19.5)
        }
        text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backView.snp.top).offset((bounds.height) / 19)
        }
        certificationButton.snp.makeConstraints {
            $0.top.equalTo(textfield.snp.bottom).offset((bounds.height) / 11)
            $0.trailing.equalToSuperview().inset((bounds.width) / 19.5)
            $0.leading.equalTo(view.snp.leading).offset((bounds.width) / 1.95)
            $0.height.equalTo((bounds.height) / 16.08)
        }
        backButton.snp.makeConstraints {
            $0.top.equalTo(textfield.snp.bottom).offset((bounds.height) / 11)
            $0.trailing.equalToSuperview().inset((bounds.width) / 1.95)
            $0.leading.equalTo(view.snp.leading).offset((bounds.width) / 19.5)
            $0.height.equalTo((bounds.height) / 16.08)
        }
        wrongtext.snp.makeConstraints {
            $0.top.equalTo(textfield.snp.bottom).offset((bounds.height) / 21.1)
            $0.centerX.equalToSuperview()
        }
    }
}

extension ModalViewController {
    func success() {
        self.navigationController?.popViewController(animated: true)
        print("성공")
    }
    
    func faliure() {
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.wrong!.cgColor
        wrongtext.textColor = .wrong
    }
    
    func certification() {
        let param = CertificationRequest.init(self.textfield.text!)
        print(param)
        authProvider.request(.certification(param: param)) {response in
            switch response {
            case .success(let result):
                do {
                    let str = try result.mapJSON()
                    print(str)
                    self.userData = try result.map(CertificationModel.self)
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
