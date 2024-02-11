// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран регистрации пользователя
class RegistrationViewController: UIViewController {
    // MARK: - Private Properties

    private var birthdayIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageBirthday")
        return imageView
    }()

    private var reminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textColor = #colorLiteral(red: 0.3691021204, green: 0.2623001337, blue: 0.5959864259, alpha: 1)
        label.textAlignment = .center
        label.font = .verdanaBold18()
        label.numberOfLines = 0
        return label
    }()

    private var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = #colorLiteral(red: 0.9931142926, green: 0.1881311536, blue: 0.3572800756, alpha: 1)
        label.font = .verdanaBold26()
        return label
    }()

    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = #colorLiteral(red: 0.9931142926, green: 0.1881311536, blue: 0.3572800756, alpha: 1)
        label.font = .verdanaBold16()
        return label
    }()

    private lazy var typingEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private var lineEmailView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = #colorLiteral(red: 0.9931142926, green: 0.1881311536, blue: 0.3572800756, alpha: 1)
        label.font = .verdanaBold16()
        return label
    }()

    private lazy var typingPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private var encapsulationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eye")
        return imageView
    }()

    private var linePasswordView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var useFaceLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "Use Face"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var inputButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9638293386, green: 0.7112590671, blue: 0.7471126914, alpha: 1)
        button.isEnabled = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(goToNextController), for: .touchUpInside)
        return button
    }()

    private lazy var useFaceSwitch: UISwitch = {
        let useSwitch = UISwitch()
        useSwitch.isOn = false
        useSwitch.isHidden = true
        return useSwitch
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addingOnView()
    }

    override func viewWillLayoutSubviews() {
        arrangesSize()
    }

    // MARK: - Private Methods

    private func addingOnView() {
        view.addSubview(birthdayIconImageView)
        view.addSubview(reminderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(typingEmailTextField)
        view.addSubview(lineEmailView)
        view.addSubview(passwordLabel)
        view.addSubview(typingPasswordTextField)
        view.addSubview(encapsulationIconImageView)
        view.addSubview(linePasswordView)
        view.addSubview(inputButton)
        view.addSubview(useFaceLabel)
        view.addSubview(useFaceSwitch)
    }

    private func arrangesSize() {
        birthdayIconImageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        reminderLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        typingEmailTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        lineEmailView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        typingPasswordTextField.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        encapsulationIconImageView.frame = CGRect(x: 330, y: 422, width: 22, height: 19)
        linePasswordView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        inputButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        useFaceLabel.frame = CGRect(x: 115, y: 554, width: 150, height: 35)
        useFaceSwitch.frame = CGRect(x: 205, y: 554, width: 54, height: 34)
    }

    @objc
    private func textFieldDidChange() {
        if typingEmailTextField.text != "", typingPasswordTextField.text != "" {
            inputButton.isEnabled = true
            inputButton.backgroundColor = #colorLiteral(red: 0.9931142926, green: 0.1881311536, blue: 0.3572800756,
                                            alpha: 1)
            useFaceLabel.isHidden = false
            useFaceSwitch.isHidden = false
        } else {
            inputButton.isEnabled = false
            inputButton.backgroundColor = #colorLiteral(red: 0.9638293386, green: 0.7112590671, blue: 0.7471126914,
                                            alpha: 1)
            useFaceLabel.isHidden = true
            useFaceSwitch.isHidden = true
        }
    }

    @objc
    private func goToNextController() {
        let nextViewController = BirthdayListViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
