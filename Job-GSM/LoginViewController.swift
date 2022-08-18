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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addView()
        setLayout()
    }
    
    let backgroundLogo = UIImageView().then {
        $0.image = UIImage(named: "backgroundLogo.png")
    }
    
    let Vector1 = UIImageView().then {
        $0.image = UIImage(named: "Vector1.png")
    }
    
    let Logo = UIImageView().then {
        $0.image = UIImage(named: "Job-Logo.png")
    }
    
    lazy var signUpButton = UIButton().then{
        let text = NSAttributedString(string: "가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 10
    }
    
    private func addView() {
        [backgroundLogo,Vector1,Logo,signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        backgroundLogo.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(10)
            $0.centerX.equalToSuperview()
        }
        Vector1.snp.makeConstraints{
            $0.top.equalTo(backgroundLogo.snp.bottom).offset(-130)
            $0.centerX.equalToSuperview()
        }
        Logo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(135)
            $0.centerX.equalToSuperview()
        }
        signUpButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(247)
            $0.size.equalTo(bounds.height * 0.05)
            $0.trailing.equalToSuperview().offset(-89)
        }
    }
    
        
}
