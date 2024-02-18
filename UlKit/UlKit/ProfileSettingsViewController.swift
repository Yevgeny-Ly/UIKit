// ProfileSettingsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран настройки данных профиля
final class ProfileSettingsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let screenTitle = "Мои данные"
        static let nameTextFieldPlaceholder = "Имя"
        static let lastNameTextFieldPlaceholder = "Фамилия"
        static let numberTextFieldPlaceholder = "Номер телефона"
        static let footSizeTextFieldPlaceholder = "Размер ноги"
        static let birthdayTextFieldPlaceholder = "Дата Рождения"
        static let emailTextFieldPlaceholder = "Почта"
        static let doneEditingTextFieldButtonText = "Готово"
        static let saveButtonText = "Сохранить"

        static let formSpacing = (x: 20.0, y: 16.0)
        static let textFieldSpacing = 10.0
        static let saveButtonPaddingBottom = 100.0
    }

    // MARK: - Visual Components

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
        field.keyboardType = .numberPad
        field.inputAccessoryView = makeTextFieldToolbar()
        return field
    }()

    private lazy var footSizeTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.footSizeTextFieldPlaceholder
        field.keyboardType = .numberPad
        field.inputAccessoryView = makeTextFieldToolbar()
        return field
    }()

    private lazy var birthdayTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.birthdayTextFieldPlaceholder
        field.inputView = birthdayDatePicker
        field.inputAccessoryView = makeTextFieldToolbar()
        return field
    }()

    private lazy var emailTextField: UITextField = {
        let field = PlainTextField()
        field.placeholder = Constants.emailTextFieldPlaceholder
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        return field
    }()

    private lazy var birthdayDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .inline
        picker.addTarget(self, action: #selector(updateBirthDatePickerValue(_:)), for: .valueChanged)
        return picker
    }()

    private lazy var saveButton: UIButton = {
        let button = PrimaryButton()
        button.setTitle(Constants.saveButtonText, for: .normal)
        button.isHidden = true
        return button
    }()

    // MARK: - Private Properties

    private var formTextFields: [UITextField] { [
        nameTextField,
        lastNameTextField,
        numberTextField,
        footSizeTextField,
        birthdayTextField,
        emailTextField
    ] }
    private var activeTextField: UITextField?
    private var formData = ProfileFormData() {
        didSet {
            numberTextField.text = formData.formattedPhoneNumber
            birthdayTextField.text = formData.formattedBirthDate
            isSaveEnabled = !formData.isEmpty
        }
    }

    private var isSaveEnabled = false {
        didSet {
            saveButton.isHidden = !isSaveEnabled
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        setupNavigationItem()
        view.backgroundColor = .white

        for textField in formTextFields {
            view.addSubview(textField)
            textField.delegate = self
            textField.addTarget(self, action: #selector(updateTextFieldValue(_:)), for: .editingChanged)
        }
        view.addSubview(saveButton)

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

        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.formSpacing.x)
            .isActive = true
        view.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: Constants.formSpacing.x)
            .isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: saveButton.bottomAnchor,
            constant: Constants.saveButtonPaddingBottom
        ).isActive = true
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

    private func makeTextFieldToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: Constants.doneEditingTextFieldButtonText,
            style: .plain,
            target: self,
            action: #selector(finishEditingTextField)
        )
        toolbar.setItems([UIBarButtonItem(systemItem: .flexibleSpace), doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }

    @objc private func updateTextFieldValue(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            formData.name = textField.text
        case numberTextField:
            formData.number = textField.text
        case lastNameTextField:
            formData.lastName = textField.text
        case footSizeTextField:
            formData.footSize = textField.text
        case emailTextField:
            formData.email = textField.text
        default:
            break
        }
    }

    @objc private func updateBirthDatePickerValue(_ datePicker: UIDatePicker) {
        formData.dateOfBirth = datePicker.date
    }

    @objc private func finishEditingTextField() {
        activeTextField?.resignFirstResponder()
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}

/// Обработка текстовых филдов
extension ProfileSettingsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
}
