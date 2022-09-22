//
//  MainViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/06.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }


}

extension UIColor {
    class var button: UIColor? {return UIColor(named: "button")}
    class var text: UIColor? {return UIColor(named: "text")}
    class var background: UIColor? {return UIColor(named: "background")}
    class var wrong: UIColor? {return UIColor(named: "wrong")}
    class var placeholderwrong: UIColor? {return UIColor(named: "placeholderwrong")}
}
