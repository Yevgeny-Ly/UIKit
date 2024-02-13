// PaymentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран, запршивающий код из смс
final class PaymentViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var promptLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 146, width: 315, height: 44))
        label.text = "Введите кодъ изъ смс, чтобы подтвердить оплату"
        label.numberOfLines = 0
        label.font = .verdana16()
        label.textAlignment = .center
        return label
    }()

    private lazy var confirmButton: UIButton = {
        let button = CustomButton()
        button.frame.origin = CGPoint(x: 20, y: 632)
        button.titleText = "Подтвердить"
        button.isEnabled = false
        return button
    }()

    private lazy var codeTextField: UITextField = {
        let field = UITextField(frame: CGRect(x: 61, y: 217, width: 262, height: 44))
        field.font = .verdanaBold18()
        field.borderStyle = .roundedRect
        field.keyboardType = .numberPad
        field.layer.borderColor = UIColor.grayMain.cgColor
        field.textAlignment = .center

        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(returnFromTextField)
        )
        toolbar.items = [UIBarButtonItem(systemItem: .flexibleSpace), doneButton]
        toolbar.sizeToFit()

        field.inputAccessoryView = toolbar
        return field
    }()

    private lazy var resendButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 109, y: 288, width: 167, height: 36))
        button.layer.cornerRadius = 10
        button.backgroundColor = .grayLight
        button.setAttributedTitle(
            NSAttributedString(
                string: "Отправить снова",
                attributes: [
                    .font: UIFont.verdana16() ?? UIFont.systemFont(ofSize: 16),
                    .foregroundColor: UIColor.specialGreen
                ]
            ), for: .normal
        )
        return button
    }()

    // MARK: - Private Properties

    private var codeFromSms: String = "" {
        didSet {
            confirmButton.isEnabled = codeFromSms == "1234"
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.addSubview(promptLabel)
        view.addSubview(confirmButton)
        view.addSubview(codeTextField)
        view.addSubview(resendButton)

        codeTextField.addTarget(self, action: #selector(changeCodeFromSms(_:)), for: .editingChanged)
        confirmButton.addTarget(self, action: #selector(confirmPayment), for: .touchUpInside)
    }

    private func setupNav() {
        navigationItem.title = "Кодъ из СМС"
        navigationController?.navigationBar
            .titleTextAttributes = [.font: UIFont.verdanaBold18() ?? UIFont.boldSystemFont(ofSize: 18)]
        let backButton = UIBarButtonItem(
            image: .backIcon.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.setLeftBarButton(backButton, animated: false)
    }

    @objc private func changeCodeFromSms(_ textField: UITextField) {
        if textField == codeTextField, let code = textField.text {
            codeFromSms = code
        }
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func returnFromTextField() {
        codeTextField.resignFirstResponder()
    }

    @objc private func confirmPayment() {
//        let gratitudeVC = FinalViewController()
//        gratitudeVC.presentationStyle = .fullScreen
//        present(gratitudeVC, animated: true)
    }
}
