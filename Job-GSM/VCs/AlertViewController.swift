//
//  AlertViewController.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/08.
//

import UIKit

class AlertViewController: UIViewController {

    var titleText: String?
    var message: String?
    var attributedMessageText: NSAttributedString?
    var contentView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        return view
    }()

    private lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12.0
        view.alignment = .center

        return view
    }()

    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20.0
        view.distribution = .fillEqually

        return view
    }()
    
    private lazy var titleLabel: UILabel? = {
        let label = UILabel()
        label.text = titleText
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black

        return label
    }()

    private lazy var messageLabel: UILabel? = {
        guard messageText != nil || attributedMessageText != nil else { return nil }

        let label = UILabel()
        label.text = messageText
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .gray
        label.numberOfLines = 0

        if let attributedMessageText = attributedMessageText {
            label.attributedText = attributedMessageText
        }

        return label
    }()
}
