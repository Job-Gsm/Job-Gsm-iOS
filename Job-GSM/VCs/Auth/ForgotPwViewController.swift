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
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 4, spread: 0)
    }
    
    let forgotMyPw = UILabel().then{
        $0.text = "비밀번호를 잊어버렸나요?"
        $0.textColor = .black
        $0.font = UIFont(name: "Kreon-Regular", size: 25)
    }
    
    lazy var enterEmailField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.placeholder = "email 주소를 입력해주세요"
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    lazy var newPwField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.placeholder = "새 비밀번호"
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 15)
        $0.addLeftPadding()
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    lazy var againPwField = UITextField().then{
        $0.backgroundColor = UIColor(red: 0.92156862745, green: 0.92156862745, blue: 0.92156862745, alpha: 0.7)
        $0.placeholder = "비밀번호 확인"
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
        $0.addTarget(self, action: #selector(certificationAction), for: .touchUpInside)
    }
    
    lazy var changeButton = UIButton().then{
        let text = NSAttributedString(string: "변경하기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .button
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 2, blur: 0, spread: 0)
    }
    let pwText = UILabel().then{
        $0.text = "비밀번호가 기억나셨나요?"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.font = UIFont(name: "Kreon-Regular", size: 14)
    }
    lazy var backLoginButton = UIButton().then {
        let text = NSAttributedString(string: "로그인으로 돌아가기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Kreon-Regular", size: 14)
        $0.setTitleColor(UIColor.text, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(backLogin), for: .touchUpInside)
    }
    @objc func backLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func certificationAction() {
        let popupViewController = AlertViewController(title: "인증번호를 입력하세요")
          popupViewController.modalPresentationStyle = .overFullScreen
          self.present(popupViewController, animated: false)
    }
    
    private func addView() {
        [vector2,background,forgotMyPw,enterEmailField,newPwField,againPwField,changeButton,certificationButton,backLoginButton,pwText].forEach {
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
        enterEmailField.snp.makeConstraints{
            $0.top.equalTo(forgotMyPw.snp.bottom).offset(31)
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(58)
            $0.trailing.equalToSuperview().offset(-119)
        }
        certificationButton.snp.makeConstraints {
            $0.top.equalTo(forgotMyPw.snp.bottom).offset(31)
            $0.height.equalTo(44)
            $0.leading.equalTo(enterEmailField.snp.trailing).offset(7)
            $0.trailing.equalToSuperview().offset(-58)
        }
        newPwField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(enterEmailField.snp.bottom).offset(14)
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(58)
        }
        againPwField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(newPwField.snp.bottom).offset(14)
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(58)
        }
        changeButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(againPwField.snp.bottom).offset(10)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(58)
        }
        backLoginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeButton.snp.bottom).offset(38)
        }
        pwText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeButton.snp.bottom).offset(10)
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

extension CALayer {
    func applySketchShadow(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
