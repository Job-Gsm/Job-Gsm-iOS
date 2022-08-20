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
    
    private func addView() {
        [Vector2,background,textLogo,idTextField,idUnderLine,idIcon].forEach {
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
    }
}
