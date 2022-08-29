//
//  ForgotPwViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/08/20.
//

import UIKit
import SnapKit
import Then
import DropDown

class ForgotPwViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }   

    let vector2 = UIImageView().then {
        $0.image = UIImage(named: "Vector2.png")
    }
        
    let background = UIView().then{
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    let forgotMyPw = UILabel().then{
        $0.text = "비밀번호를 잊어버렸나요?"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 25)
    }
    
    let forgotMyPwText = UILabel().then{
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.text = "입력하신 이메일 주소로 비밀번호를 \n 초기화하는 링크를 보내드리겠습니다."
        $0.textColor = .black
        $0.layer.opacity = 0.4
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
    }
    
    lazy var enterEmailField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.placeholder = "email 주소를 입력해주세요"
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
    }
    
    private func addView() {
        [vector2,background,forgotMyPw,forgotMyPwText,enterEmailField].forEach {
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
            $0.height.equalTo(404)
            $0.width.equalTo(318)
        }
        forgotMyPw.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(259)
        }
        forgotMyPwText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(forgotMyPw.snp.bottom).offset(14)
        }
        enterEmailField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(forgotMyPwText.snp.bottom).offset(61)
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(58)
        }
    }
}


extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
