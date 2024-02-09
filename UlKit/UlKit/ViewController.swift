// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает начальный экран решистрации
class ViewController: UIViewController {
    
    
    @IBOutlet var logoCafeImage: UIImageView!
    @IBOutlet var nameCafeLabel: UILabel!
    @IBOutlet var authorizationLabel: UILabel!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var line: UIView!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var secondLine: UIView!
    @IBOutlet var logoEyes: UIImageView!
    @IBOutlet var startutton: UIButton!

    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustsTextField()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        adjustsFrame()
    }

    //MARK: -Private method
    private func adjustsFrame() {
        logoCafeImage.frame = CGRect(x: 100, y: 52, width: 175, height: 164.39)
        nameCafeLabel.frame = CGRect(x: 100, y: 223, width: 175, height: 22)
        authorizationLabel.frame = CGRect(x: 20, y: 266, width: 195, height: 31)
        loginLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        loginTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        line.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        passwordTextField.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        secondLine.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        logoEyes.frame = CGRect(x: 330, y: 419, width: 22, height: 19)
        startutton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
    }
    
    //MARK: -Private method
    private func adjustsTextField() {
        passwordTextField.isSecureTextEntry = true
    }
}
