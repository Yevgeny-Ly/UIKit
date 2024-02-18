// ProductCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProductCardViewDelegate: AnyObject {
    func respondToCartButtonPress(_ productCardView: ProductCardView, product: Product)
}

/// Карточка товара
final class ProductCardView: UIView {
    // MARK: - Constants

    enum Constants {
        static let productImageMaxSize = CGSize(width: 100, height: 100)
        static let productCardMinSize = CGSize(width: 157, height: 157)
        static let cartButtonSize = CGSize(width: 20, height: 20)
        static let cartButtonPadding = (x: 8.0, y: 11.0)
    }

    // MARK: - Visual Components

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.productImageMaxSize.width).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.productImageMaxSize.height)
            .isActive = true
        return imageView
    }()

    private lazy var cartIconButton: UIButton = {
        let button = UIButton()
        button.setImage(.cartIcon, for: .normal)
        button.setImage(.cartIconFill, for: .highlighted)
        button.addTarget(self, action: #selector(cartButtonPressed), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: Constants.cartButtonSize.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: Constants.cartButtonSize.height).isActive = true
        return button
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Public Properties

    weak var delegate: ProductCardViewDelegate?

    var productImage: String? {
        didSet {
            productImageView.image = UIImage(named: productImage ?? "")
        }
    }

    var price: Int? {
        didSet {
            if let price = price {
                priceLabel.text = "\(price) ₽"
            } else {
                priceLabel.text = ""
            }
        }
    }

    var isAddedToCart: Bool = false {
        didSet {
            cartIconButton.setImage(isAddedToCart ? .cartIconFill : .cartIcon, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    private func setupView() {
        backgroundColor = .grayLight
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(productImageView)
        addSubview(cartIconButton)
        addSubview(priceLabel)
    }

    private func setupConstraints() {
        widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.productCardMinSize.width).isActive = true
        heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.productCardMinSize.height).isActive = true
        centerXAnchor.constraint(equalTo: productImageView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: productImageView.centerYAnchor).isActive = true
        cartIconButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.cartButtonPadding.y).isActive = true
        trailingAnchor.constraint(equalTo: cartIconButton.trailingAnchor, constant: Constants.cartButtonPadding.x)
            .isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 15).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 15).isActive = true
    }

    @objc private func cartButtonPressed() {
        let productCardView = ProductCardView()
        if let productImage = productImage,
           let price = price
        {
            let product: Product = .init(name: "", image: productImage, price: price)
            delegate?.respondToCartButtonPress(self, product: product)
            isAddedToCart = true
        }
    }
}
