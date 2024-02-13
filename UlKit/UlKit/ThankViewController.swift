// ThankViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран благодарности

final class ThankViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var closeButton: UIButton = {
        let image = UIImage(named: "clear")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    private var finalPatternImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "finalPattern")
        return imageView
    }()

    private var thankImageView = UIImageView(image: .thank)

    lazy var homeScreenButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Хорошо", for: .normal)
        button.titleLabel?.font = .verdanaBold18()
        button.frame.origin = CGPoint(x: 15, y: 600)
        button.addTarget(self, action: #selector(returnToMenu), for: .touchUpInside)
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
        view.addSubview(closeButton)
        view.addSubview(finalPatternImageView)
        view.addSubview(thankImageView)
        view.addSubview(messageLabel)
        view.addSubview(homeScreenButton)
    }

    private func setupViews() {
        closeButton.frame = CGRect(x: 20, y: 50, width: 24, height: 24)
        finalPatternImageView.frame = CGRect(x: 85, y: 100, width: 200, height: 86)
        thankImageView.frame = CGRect(x: 125, y: 240, width: 120, height: 90)
        messageLabel.frame = CGRect(x: 30, y: 375, width: 315, height: 89)
    }

    @objc
    private func closeViewController() {
        dismiss(animated: true)
    }

    @objc
    private func returnToMenu() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .fullScreen
        present(menuViewController, animated: true)
    }
}
