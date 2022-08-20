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
    
    private func addView() {
        [Vector2].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Vector2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}
