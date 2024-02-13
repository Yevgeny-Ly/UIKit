// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран оплаты заказа
class OrderViewController: UIViewController {

    var orderItems: [(String, Int)]?

    var labels: [UILabel] = []
    var labelWidth: CGFloat = 280
    var labelHeight: CGFloat = 30
    var yOffset: CGFloat = 155

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
        label.text = "Цъна - 200 руб"
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
        button.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()

        if let additions = orderItems {
            for (index, (ingredient, price)) in additions.enumerated() {
                let priceLabel = UILabel(frame: CGRect(x: 225, y: yOffset, width: 130, height: labelHeight))
                let ingredientLabel = UILabel(frame: CGRect(x: 20, y: yOffset, width: labelWidth, height: labelHeight))
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
                yOffset += labelHeight + 10

                view.addSubview(ingredientLabel)
                view.addSubview(priceLabel)
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(leftPatternImageView)
        view.addSubview(closesButton)
        view.addSubview(rightPatternImageView)
        view.addSubview(orderLabel)
//        view.addSubview(itemCheckLabel)
//        view.addSubview(priceFirstLabel)
//        view.addSubview(firstAdditionLabel)
//        view.addSubview(priceSecondLabel)
//        view.addSubview(secondAdditionLabel)
//        view.addSubview(priceThirdLabel)
        view.addSubview(finalCostLabel)
        view.addSubview(patternLogoImageView)
        view.addSubview(payButton)
    }

    private func setupViews() {
        leftPatternImageView.frame = CGRect(x: 20, y: 50, width: 100, height: 72)
        closesButton.frame = CGRect(x: 15, y: 21, width: 24, height: 24)
        rightPatternImageView.frame = CGRect(x: 250, y: 50, width: 100, height: 72)
        orderLabel.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
//        itemCheckLabel.frame = CGRect(x: 20, y: 155, width: 150, height: 30)
//        priceFirstLabel.frame = CGRect(x: 285, y: 155, width: 130, height: 30)
//        firstAdditionLabel.frame = CGRect(x: 20, y: 191, width: 150, height: 30)
//        priceSecondLabel.frame = CGRect(x: 300, y: 191, width: 130, height: 30)
//        secondAdditionLabel.frame = CGRect(x: 20, y: 227, width: 150, height: 30)
//        priceThirdLabel.frame = CGRect(x: 300, y: 227, width: 130, height: 30)
        finalCostLabel.frame = CGRect(x: 105, y: 400, width: 231, height: 30)
        patternLogoImageView.frame = CGRect(x: 135, y: 430, width: 100, height: 40)
    }

    @objc
    private func closesViewController() {
        dismiss(animated: true)
    }

    @objc
    private func goToNextViewController() {
        let nextViewController = ThankViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
}
