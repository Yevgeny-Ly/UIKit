// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает экран оплаты заказа
class OrderViewController: UIViewController {
    // MARK: - Public Properties

    var orderItems: [(String, Int)]?
    var orderSum: Int?

    // MARK: - Private Properties

    private var labels: [UILabel] = []
    private var labelWidth: CGFloat = 280
    private var labelHeight: CGFloat = 30
    private var offsetSubview: CGFloat = 155

    private lazy var closesButton: UIButton = {
        let image = UIImage(named: "clear")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closesViewController), for: .touchUpInside)
        return button
    }()

    private var leftPatternImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "leftPattern")
        return imageView
    }()

    private var rightPatternImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rightPattern")
        return imageView
    }()

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
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.frame.origin.x = 15
        button.setTitleColor(.white, for: .normal)
        button.frame.origin.y = 600
        button.addTarget(self, action: #selector(thanksTheOrder), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupLabel()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(leftPatternImageView)
        view.addSubview(closesButton)
        view.addSubview(rightPatternImageView)
        view.addSubview(orderLabel)
        view.addSubview(finalCostLabel)
        view.addSubview(patternLogoImageView)
        view.addSubview(payButton)
    }

    private func setupLabel() {
        if let additions = orderItems {
            for (index, (ingredient, price)) in additions.enumerated() {
                let priceLabel = UILabel(frame: CGRect(x: 225, y: offsetSubview, width: 130, height: labelHeight))
                let ingredientLabel = UILabel(frame: CGRect(
                    x: 20,
                    y: offsetSubview,
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
                offsetSubview += labelHeight + 10

                view.addSubview(ingredientLabel)
                view.addSubview(priceLabel)
            }
        }

        if let sum = orderSum {
            finalCostLabel.text = "Цъна - \(sum) руб"
        }
    }

    private func setupViews() {
        leftPatternImageView.frame = CGRect(x: 20, y: 50, width: 100, height: 72)
        closesButton.frame = CGRect(x: 15, y: 21, width: 24, height: 24)
        rightPatternImageView.frame = CGRect(x: 250, y: 50, width: 100, height: 72)
        orderLabel.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
        finalCostLabel.frame = CGRect(x: 105, y: 400, width: 231, height: 30)
        patternLogoImageView.frame = CGRect(x: 135, y: 430, width: 100, height: 40)
    }

    @objc
    private func closesViewController() {
        dismiss(animated: true)
    }

    @objc
    private func thanksTheOrder() {
        let thankViewController = ThankViewController()
        thankViewController.modalPresentationStyle = .fullScreen
        present(thankViewController, animated: true)
    }
}
