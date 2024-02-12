// HumanAdditionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран добавления именинников в список
class HumanAdditionViewController: UIViewController {
    // MARK: - Private Properties

    private let agePickerView = UIPickerView()
    private let genderPickerView = UIPickerView()

    private let numbers = Array(1 ... 100)
    private let genders = ["male", "female"]

    private let toolBar = UIToolbar()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(closesViewController), for: .touchUpInside)
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(method), for: .touchUpInside)
        return button
    }()

    private var photoPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photoPerson")
        return imageView
    }()

    private lazy var changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change photo", for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(method), for: .touchUpInside)
        return button
    }()

    private var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var nameSurnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Name Surname"
        return textField
    }()

    private var firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Date of Birthday"
        return textField
    }()

    private var birthdayDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        return picker
    }()

    private var secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Age"
        return textField
    }()

    private var thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Indicate Gender"
        return textField
    }()

    private var fourthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    private var telegramLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.font = .verdanaBold16()
        label.textColor = .black
        return label
    }()

    private lazy var telegramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Telegram"
        return textField
    }()

    private var fifthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addsOnView()
        createDatePicker()
        createPickerView()
        createAlertController()
    }

    override func viewWillLayoutSubviews() {
        setupSubviews()
    }

    // MARK: - Private Methods

    private func addsOnView() {
        view.backgroundColor = .white
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(photoPersonImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameSurnameLabel)
        view.addSubview(nameSurnameTextField)
        view.addSubview(firstLineView)
        view.addSubview(birthdayLabel)
        view.addSubview(secondLineView)
        view.addSubview(birthdayTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(thirdLineView)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(fourthLineView)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(fifthLineView)
    }

    private func setupSubviews() {
        cancelButton.frame = CGRect(x: 20, y: 20, width: 50, height: 20)
        addButton.frame = CGRect(x: 325, y: 20, width: 30, height: 20)
        photoPersonImageView.frame = CGRect(x: 125, y: 50, width: 125, height: 125)
        changePhotoButton.frame = CGRect(x: 125, y: 180, width: 125, height: 20)
        nameSurnameLabel.frame = CGRect(x: 20, y: 220, width: 175, height: 19)
        nameSurnameTextField.frame = CGRect(x: 20, y: 250, width: 250, height: 17)
        firstLineView.frame = CGRect(x: 20, y: 275, width: 335, height: 1)
        birthdayLabel.frame = CGRect(x: 20, y: 300, width: 175, height: 19)
        birthdayTextField.frame = CGRect(x: 20, y: 325, width: 250, height: 25)
        secondLineView.frame = CGRect(x: 20, y: 355, width: 335, height: 1)
        ageLabel.frame = CGRect(x: 20, y: 380, width: 175, height: 19)
        ageTextField.frame = CGRect(x: 20, y: 410, width: 250, height: 17)
        thirdLineView.frame = CGRect(x: 20, y: 435, width: 335, height: 1)
        genderLabel.frame = CGRect(x: 20, y: 460, width: 175, height: 19)
        genderTextField.frame = CGRect(x: 20, y: 490, width: 250, height: 17)
        fourthLineView.frame = CGRect(x: 20, y: 515, width: 335, height: 1)
        telegramLabel.frame = CGRect(x: 20, y: 540, width: 175, height: 19)
        telegramTextField.frame = CGRect(x: 20, y: 570, width: 250, height: 17)
        fifthLineView.frame = CGRect(x: 20, y: 595, width: 335, height: 1)
    }

    private func createDatePicker() {
        toolBar.sizeToFit()

        birthdayTextField.inputAccessoryView = toolBar
        birthdayTextField.inputView = birthdayDatePicker
        birthdayDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }

    private func createPickerView() {
        let okButton = UIBarButtonItem(title: "Ок", style: .plain, target: self, action: #selector(okButtonTapped))
        okButton.tintColor = .systemBlue
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpace, okButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        agePickerView.tag = 1
        agePickerView.delegate = self
        agePickerView.dataSource = self

        ageTextField.inputAccessoryView = toolBar
        ageTextField.inputView = agePickerView

        genderPickerView.tag = 2
        genderPickerView.delegate = self
        genderPickerView.delegate = self

        genderTextField.inputAccessoryView = toolBar
        genderTextField.inputView = genderPickerView
    }

    private func createAlertController() {
        telegramTextField.delegate = self
    }

    @objc
    private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
    }

    @objc
    private func closesViewController() {
        dismiss(animated: true)
    }

    @objc
    private func okButtonTapped() {
        nameSurnameTextField.resignFirstResponder()
        birthdayTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
    }
}

// MARK: - Extension

extension HumanAdditionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return numbers.count
        } else if pickerView.tag == 2 {
            return genders.count
        }
        return 0
    }
}

extension HumanAdditionViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return String(numbers[row])
        } else if pickerView.tag == 2 {
            return genders[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let selectAge = String(numbers[row])
            ageTextField.text = selectAge
        } else if pickerView.tag == 2 {
            let selectGender = genders[row]
            genderTextField.text = selectGender
        }
    }
}

extension HumanAdditionViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == telegramTextField {
            let alertController = UIAlertController(
                title: "Please enter Telegram",
                message: nil,
                preferredStyle: .alert
            )

            alertController.addTextField { textField in
                textField.placeholder = "Typing Telegram"
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)

            let doneAction = UIAlertAction(title: "Ok", style: .default) { _ in
                if let nickname = alertController.textFields?.first?.text {
                    self.telegramTextField.text = "@\(nickname)"
                }
            }
            alertController.addAction(doneAction)

            present(alertController, animated: true, completion: nil)

            return false
        }

        return true
    }
}
