// ThankViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран благодарности
protocol DelegateProtocol: AnyObject {
    func yourDelegateMethod()
}

final class ThankViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var closesButton: UIButton = {
        let image = UIImage(named: "clear")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closesViewController), for: .touchUpInside)
        return button
    }()

    private var finalPatternImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "finalPattern")
        return imageView
    }()

    private var thankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thank")
        return imageView
    }()

    lazy var homeScreenButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Хорошо", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.frame.origin.x = 15
        button.setTitleColor(.white, for: .normal)
        button.frame.origin.y = 600
        button.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
        return button
    }()

    private var messageLabel: UILabel = {
        let label = UILabel()
        label.text =
            "Разскажи о насъ другу, отправь ему \n промокодъ \n на безплатный напитокъ и получи скидку 10% на сльедубщiй заказъ"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .verdana16()
        label.textColor = .systemGray3
        return label
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
        view.backgroundColor = .white
        view.addSubview(closesButton)
        view.addSubview(finalPatternImageView)
        view.addSubview(thankImageView)
        view.addSubview(messageLabel)
        view.addSubview(homeScreenButton)
    }

    private func setupViews() {
        closesButton.frame = CGRect(x: 20, y: 50, width: 24, height: 24)
        finalPatternImageView.frame = CGRect(x: 85, y: 100, width: 200, height: 86)
        thankImageView.frame = CGRect(x: 125, y: 240, width: 120, height: 90)
        messageLabel.frame = CGRect(x: 30, y: 375, width: 315, height: 89)
    }

    @objc
    private func closesViewController() {
        dismiss(animated: true)
    }

    @objc
    private func backToMenu() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true)
    }
}
