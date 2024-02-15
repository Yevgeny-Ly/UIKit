// ProfileSettingsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран настройки данных профиля
final class ProfileSettingsViewController: UIViewController {
    enum Constants {
        static let screenTitle = "Мои данные"
        static let nameTextFieldPlaceholder = "Имя"
        static let lastNameTextFieldPlaceholder = "Фамилия"
        static let numberTextFieldPlaceholder = "Номер телефона"
        static let footSizeTextFieldPlaceholder = "Размер ноги"
        static let birthdayTextFieldPlaceholder = "Дата Рождения"
        static let emailTextFieldPlaceholder = "Почта"

        static let formSpacing = (x: 20.0, y: 16.0)
        static let textFieldSpacing = 10.0
    }

    private lazy var nameTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.nameTextFieldPlaceholder
        return field
    }()

    private lazy var lastNameTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.lastNameTextFieldPlaceholder
        return field
    }()

    private lazy var numberTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.numberTextFieldPlaceholder
        return field
    }()

    private lazy var footSizeTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.footSizeTextFieldPlaceholder
        return field
    }()

    private lazy var birthdayTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.birthdayTextFieldPlaceholder
        return field
    }()

    private lazy var emailTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.emailTextFieldPlaceholder
        return field
    }()

    private var formTextFields: [UITextField] { [
        nameTextField,
        lastNameTextField,
        numberTextField,
        footSizeTextField,
        birthdayTextField,
        emailTextField
    ] }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        setupNavigationItem()
        view.backgroundColor = .white

        for textField in formTextFields {
            view.addSubview(textField)
        }

        setupConstraints()
    }

    private func setupConstraints() {
        var previousTextField: UITextField?
        for textField in formTextFields {
            if let previousTextField {
                textField.topAnchor.constraint(
                    equalTo: previousTextField.bottomAnchor,
                    constant: Constants.textFieldSpacing
                ).isActive = true

            } else {
                textField.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: Constants.formSpacing.y
                ).isActive = true
            }
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.formSpacing.x)
                .isActive = true
            view.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: Constants.formSpacing.x)
                .isActive = true
            previousTextField = textField
        }
    }

    private func setupNavigationItem() {
        title = Constants.screenTitle
        let backBarItem = UIBarButtonItem(
            image: .backIcon.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.setLeftBarButton(backBarItem, animated: false)
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}
