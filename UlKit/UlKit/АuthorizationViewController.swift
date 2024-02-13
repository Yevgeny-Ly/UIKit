// АuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран авторизации пользователя
class АuthorizationViewController: UIViewController {
    private var isPasswordVisible = false

    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoCofeinov")
        return imageView
    }()

    private var backUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private var authorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = .verdanaBold26()
        label.textColor = .black
        return label
    }()

    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите почту"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private var lineLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = .black
        label.font = .verdanaBold16()
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private lazy var encapsulationEyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeClosed"), for: .normal)
        button.addTarget(self, action: #selector(changeEncapsulatesPassword), for: .touchUpInside)
        return button
    }()

    private var passwordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private lazy var inputButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .specialGreen
        button.alpha = 0.3
//        button.isEnabled = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    private func addSubviews() {
        view.backgroundColor = .specialdarkBrown
        view.addSubview(logoImageView)
        view.addSubview(backUIView)
        view.addSubview(authorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(lineLoginView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordLineView)
        view.addSubview(inputButton)
        view.addSubview(encapsulationEyeButton)
    }

    private func setupViews() {
        logoImageView.frame = CGRect(x: 100, y: 135, width: 175, height: 50)
        backUIView.frame = CGRect(x: 0, y: 300, width: 375, height: 564)
        authorizationLabel.frame = CGRect(x: 20, y: 320, width: 195, height: 31)
        loginLabel.frame = CGRect(x: 20, y: 370, width: 175, height: 19)
        loginTextField.frame = CGRect(x: 20, y: 400, width: 175, height: 17)
        lineLoginView.frame = CGRect(x: 20, y: 425, width: 335, height: 1)
        passwordLabel.frame = CGRect(x: 20, y: 450, width: 175, height: 19)
        passwordTextField.frame = CGRect(x: 20, y: 480, width: 129, height: 17)
        passwordLineView.frame = CGRect(x: 20, y: 505, width: 335, height: 1)
        inputButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        encapsulationEyeButton.frame = CGRect(x: 330, y: 480, width: 22, height: 19)
    }

    @objc
    private func changeEncapsulatesPassword() {
        isPasswordVisible.toggle()
        if isPasswordVisible {
            passwordTextField.isSecureTextEntry = false
            encapsulationEyeButton.setImage(UIImage(named: "eye"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            encapsulationEyeButton.setImage(UIImage(named: "eyeClosed"), for: .normal)
        }
    }

    @objc
    private func textFieldDidChange() {
//        if loginTextField.text != "", passwordTextField.text != "" {
//            inputButton.isEnabled = true
//            inputButton.alpha = 1
//        } else {
//            inputButton.isEnabled = false
//            inputButton.alpha = 0.3
//        }
    }

    @objc
    private func goToNextViewController() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true)
    }
}
