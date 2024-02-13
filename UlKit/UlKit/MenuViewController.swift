// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран где располагается  меню кафе
class MenuViewController: UIViewController {
    // MARK: - Private Properties

    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoCofeinov")
        return imageView
    }()

    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать, \nГость"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .verdanaBold16()
        return label
    }()

    private var iconPersonButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3438587189, green: 0.7463406324, blue: 0.7798846364, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        return button
    }()

    private var backUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private var backgroundAddressUIView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921222508, green: 0.9661542773, blue: 0.9696832299, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()

    private var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адреса Кофеен"
        label.font = .verdanaBold12()
        label.textColor = .black
        return label
    }()

    private var privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = "Разрьшите доступъ къ геолокацiи для поиска ближайшей кофейни"
        label.numberOfLines = 0
        label.font = .verdana14()
        label.textColor = .systemGray2
        return label
    }()

    private var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoLocation")
        return imageView
    }()

    private var logoMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu")
        return imageView
    }()

    private var pieButton: UIButton = {
        let image = UIImage(named: "pie")
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.setTitle("Пти пате аля «РюcЪ»", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .specialСappuccino
        button.titleLabel?.font = UIFont(name: "Verdana-Italic", size: 18)
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -170, bottom: 0, right: -10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)
        return button
    }()

    private var beveragesButton: UIButton = {
        let image = UIImage(named: "cup")
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.setTitle("Горячiя напитки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .specialСappuccino
        button.titleLabel?.font = UIFont(name: "Verdana-Italic", size: 18)
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -220, bottom: 0, right: -10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)
        return button
    }()

    private lazy var coffeeButton: UIButton = {
        let image = UIImage(named: "coffee")
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.setTitle("Кофий", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .specialСappuccino
        button.titleLabel?.font = UIFont(name: "Verdana-Italic", size: 18)
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -310, bottom: 0, right: -10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)
        button.addTarget(self, action: #selector(toTheСoffeeSelection), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        view.backgroundColor = .specialdarkBrown
        view.addSubview(logoImageView)
        view.addSubview(greetingLabel)
        view.addSubview(iconPersonButton)
        view.addSubview(backUIView)
        backUIView.addSubview(backgroundAddressUIView)
        backgroundAddressUIView.addSubview(addressLabel)
        backgroundAddressUIView.addSubview(privacyPolicyLabel)
        backgroundAddressUIView.addSubview(locationImageView)
        view.addSubview(logoMenuImageView)
        view.addSubview(pieButton)
        view.addSubview(beveragesButton)
        view.addSubview(coffeeButton)
    }

    private func setupViews() {
        logoImageView.frame = CGRect(x: 100, y: 60, width: 175, height: 50)
        greetingLabel.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        iconPersonButton.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        backUIView.frame = CGRect(x: 0, y: 245, width: 375, height: 564)
        backgroundAddressUIView.frame = CGRect(x: 20, y: 45, width: 335, height: 70)
        addressLabel.frame = CGRect(x: 15, y: 10, width: 150, height: 15)
        privacyPolicyLabel.frame = CGRect(x: 15, y: 25, width: 260, height: 40)
        locationImageView.frame = CGRect(x: 295, y: 19, width: 20, height: 29)
        logoMenuImageView.frame = CGRect(x: 110, y: 375, width: 150, height: 80)
        pieButton.frame = CGRect(x: 20, y: 470, width: 335, height: 80)
        beveragesButton.frame = CGRect(x: 20, y: 570, width: 335, height: 80)
        coffeeButton.frame = CGRect(x: 20, y: 665, width: 335, height: 80)

        iconPersonButton.layer.cornerRadius = iconPersonButton.layer.frame.height / 2
    }

    @objc
    private func toTheСoffeeSelection() {
        let coffeeConfiguratorViewController = CoffeeConfiguratorViewController()
        let navigationController = UINavigationController(rootViewController: coffeeConfiguratorViewController())
        present(navigationController, animated: true, completion: nil)
    }
}
