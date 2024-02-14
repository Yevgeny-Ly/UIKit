// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран оплаты заказа
final class OrderViewController: UIViewController {
    // MARK: - Public Properties

    var orderItems: [(String, Int)]?
    var orderSum: Int?

    // MARK: - Private Properties

    private var dissmissClosure: (() -> Void)?

    private var labels: [UILabel] = []
    
    private var labelWidth: CGFloat = 130
    private var labelHeight: CGFloat = 30
    private var offsetXSubview: CGFloat = 225
    private var offsetYSubview: CGFloat = 175

    private lazy var closeButton: UIButton = {
        let image = UIImage(named: "clear")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    private var leftPatternImageView = UIImageView(image: .leftPattern)

    private var rightPatternImageView = UIImageView(image: .rightPattern)

    private var orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Вашъ Заказъ"
        label.font = .verdanaBold18()
        label.textColor = .black
        return label
    }()

    private var finalCostLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold18()
        label.textColor = .black
        return label
    }()

    private var patternLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu_pic")
        return imageView
    }()

    private lazy var payButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = .verdanaBold18()
        button.setTitleColor(.white, for: .normal)
        button.frame.origin = CGPoint(x: 15, y: 600)
        button.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupLabels()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(leftPatternImageView)
        view.addSubview(closeButton)
        view.addSubview(rightPatternImageView)
        view.addSubview(orderLabel)
        view.addSubview(finalCostLabel)
        view.addSubview(patternLogoImageView)
        view.addSubview(payButton)
    }

    private func setupLabels() {
        if let additions = orderItems {
            for (index, (ingredient, price)) in additions.enumerated() {
                let priceLabel = UILabel(frame: CGRect(x: offsetXSubview, y: offsetYSubview, width: labelWidth, height: labelHeight))
                let ingredientLabel = UILabel(frame: CGRect(
                    x: offsetXSubview,
                    y: offsetYSubview,
                    width: labelWidth,
                    height: labelHeight
                ))
                ingredientLabel.text = "\(ingredient)"
                priceLabel.text = "\(price) руб"
                priceLabel.textAlignment = .right

                if index == 0 {
                    ingredientLabel.font = .verdanaBold16()
                    priceLabel.font = .verdanaBold16()
                } else {
                    ingredientLabel.font = .verdana16()
                    priceLabel.font = .verdana16()
                }

                labels.append(ingredientLabel)
                offsetYSubview += labelHeight + 10

                view.addSubview(ingredientLabel)
                view.addSubview(priceLabel)
            }
        }

        if let sum = orderSum {
            finalCostLabel.text = "Цъна - \(sum) руб"
        }
    }

    private func setupViews() {
        closeButton.frame = CGRect(x: 15, y: 40, width: 24, height: 24)
        leftPatternImageView.frame = CGRect(x: 20, y: 70, width: 100, height: 72)
        rightPatternImageView.frame = CGRect(x: 250, y: 70, width: 100, height: 72)
        orderLabel.frame = CGRect(x: 120, y: 120, width: 140, height: 30)
        finalCostLabel.frame = CGRect(x: 105, y: 430, width: 231, height: 30)
        patternLogoImageView.frame = CGRect(x: 135, y: 470, width: 100, height: 40)
    }

    @objc
    private func closeViewController() {
        dismiss(animated: true)
    }

    @objc
    private func goToNextViewController() {
        let thankViewController = ThankViewController()
        thankViewController.modalPresentationStyle = .fullScreen
        present(thankViewController, animated: true)
    }
}
