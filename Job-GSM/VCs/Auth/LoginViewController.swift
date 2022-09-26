//
//  LoginViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/18.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    private let bounds = UIScreen.main.bounds

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }
    
    let background = UIImageView().then {
        $0.image = UIImage(named: "background.png")
        $0.contentMode = .scaleToFill
    }
    
    lazy var signUpButton = UIButton().then{
        let text = NSAttributedString(string: "가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signUpAction), for: UIControl.Event.touchUpInside)
    }
    lazy var signInButton = UIButton().then{
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.button, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.button?.cgColor
        $0.layer.borderWidth = 1
        $0.addTarget(self, action: #selector(signInAction), for: UIControl.Event.touchUpInside)
    }
    @objc func signInAction() {
        let sivc = SignInViewController()
        sivc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(sivc, animated: true)
    }
    @objc func signUpAction() {
        let suvc = SignUpViewController()
        suvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    private func addView() {
        [background,signUpButton,signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        signUpButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 2.7)
            $0.height.equalTo((bounds.height) / 16.08)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.40)
        }
        signInButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signUpButton.snp.bottom).offset(19)
            $0.height.equalTo((bounds.height) / 16.08)
            $0.leading.equalToSuperview().offset((bounds.width) / 6.40)
        }
    }
    
        
}
