// ProductCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProductCardViewDelegate: AnyObject {
    func respondToCartButtonPress(_ productCardView: ProductCardView)
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

    // MARK: - Public Properties

    var productImage: UIImage? {
        didSet {
            productImageView.image = productImage
        }
    }

    var price: Int?
    var isAddedToCart: Bool = false {
        didSet {
            cartIconButton.setImage(isAddedToCart ? .cartIconFill : .cartIcon, for: .normal)
        }
    }

    weak var delegate: ProductCardViewDelegate?

    // MARK: - Initializers

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

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .grayLight
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(productImageView)
        addSubview(cartIconButton)
    }

    private func setupConstraints() {
        widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.productCardMinSize.width).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        centerXAnchor.constraint(equalTo: productImageView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: productImageView.centerYAnchor).isActive = true
        cartIconButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.cartButtonPadding.y).isActive = true
        trailingAnchor.constraint(equalTo: cartIconButton.trailingAnchor, constant: Constants.cartButtonPadding.x)
            .isActive = true
    }

    @objc private func cartButtonPressed() {
        delegate?.respondToCartButtonPress(self)
    }
}
