// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран где располагается  меню кафе
final class MenuViewController: UIViewController {
    // MARK: - Private Properties

    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoCofeinov
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

    private var avatarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .specialGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = .verdanaBold16()
        return button
    }()

    private var backgroundPanelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private var backgroundAddressUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPanelAdress
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
        label.font = UIFont(name: "Verdana", size: 12)
        label.textColor = .systemGray2
        return label
    }()

    private var locationImageView = UIImageView(image: .logoLocation)

    private var logoMenuImageView = UIImageView(image: .menu)

    private lazy var pieButton: UIButton = createButton(title: "Пти пате аля «РюcЪ»", imageName: "pie")

    private lazy var beveragesButton: UIButton = createButton(title: "Горячiя напитки", imageName: "cup")

    private lazy var coffeeButton: UIButton = createButton(
        title: "Кофий",
        imageName: "coffee",
        action: #selector(toTheСoffeeSelection)
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configurationElementsButton()
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
        view.addSubview(avatarButton)
        view.addSubview(beveragesButton)
        view.addSubview(backgroundPanelView)
        backgroundPanelView.addSubview(backgroundAddressUIView)
        backgroundAddressUIView.addSubview(addressLabel)
        backgroundAddressUIView.addSubview(privacyPolicyLabel)
        backgroundAddressUIView.addSubview(locationImageView)
        view.addSubview(logoMenuImageView)
        view.addSubview(pieButton)
        view.addSubview(beveragesButton)
        view.addSubview(coffeeButton)
    }

    func createButton(title: String, imageName: String, action: Selector? = nil) -> UIButton {
        let image = UIImage(named: imageName)
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .specialСappuccino
        button.titleLabel?.font = UIFont(name: "Verdana-BoldItalic", size: 18)
        button.setImage(image, for: .normal)
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }

    private func configurationElementsButton() {
        pieButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: -10)
        pieButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 10)

        beveragesButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -210, bottom: 0, right: -10)
        beveragesButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 10)

        coffeeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -310, bottom: 0, right: -10)
        coffeeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 10)
    }

    private func setupViews() {
        logoImageView.frame = CGRect(x: 100, y: 60, width: 175, height: 50)
        greetingLabel.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        avatarButton.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        beveragesButton.frame = CGRect(x: 0, y: 245, width: 375, height: 564)
        backgroundPanelView.frame = CGRect(x: 0, y: 245, width: 375, height: 564)
        backgroundAddressUIView.frame = CGRect(x: 20, y: 45, width: 335, height: 70)
        addressLabel.frame = CGRect(x: 15, y: 10, width: 150, height: 15)
        privacyPolicyLabel.frame = CGRect(x: 15, y: 25, width: 260, height: 40)
        locationImageView.frame = CGRect(x: 295, y: 19, width: 20, height: 29)
        logoMenuImageView.frame = CGRect(x: 110, y: 375, width: 150, height: 80)
        pieButton.frame = CGRect(x: 20, y: 470, width: 335, height: 80)
        beveragesButton.frame = CGRect(x: 20, y: 570, width: 335, height: 80)
        coffeeButton.frame = CGRect(x: 20, y: 665, width: 335, height: 80)

        avatarButton.layer.cornerRadius = avatarButton.layer.frame.height / 2
    }

    @objc
    private func toTheСoffeeSelection() {
//        let coffeeConfiguratorViewController = CoffeeConfiguratorViewController()
//        navigationController?.pushViewController(coffeeConfiguratorViewController, animated: true)
    }
}
