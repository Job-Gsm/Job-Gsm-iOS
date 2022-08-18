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
    
    private func addView() {
        [backgroundLogo,Vector1].forEach {
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
    }
    
        
}
