// CartItemView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol CartItemViewDelegate: ProductCardViewDelegate {
    func respondToQuantityChanged(_ cartProductView: CartItemView)
}

/// Панель продукта в корзине
final class CartItemView: UIView {
    // MARK: - Constants

    enum Constants {
        static let quantityLabelText = "Количество"
        static let sizeLabelText = "Размер"
        static let productDescriptionLabelSize = 12.0
        static let productCardViewPaddingRight = 16.0
        static let productNameLabelPaddingTop = 18.0
        static let quantityPaddingTop = 12.0
        static let sizeLabelPaddingTop = 12.0
    }

    // MARK: - Visual Components

    private lazy var productCardView: ProductCardView = {
        let productCard = ProductCardView()
        productCard.isAddedToCart = true
        return productCard
    }()

    private lazy var productNameLabel = makeProductDescriptionLabel()
    private lazy var quantityLabel = makeProductDescriptionLabel(withText: Constants.quantityLabelText)
    private lazy var sizeLabel = makeProductDescriptionLabel(withText: Constants.sizeLabelText)

    // MARK: - Public Properties

    var cartItem: CartItem? {
        didSet {
            if let cartItem {
                productCardView.productImage = UIImage(named: cartItem.product.image)
                productNameLabel.text = cartItem.product.name
            }
        }
    }

    var delegate: CartItemViewDelegate? {
        didSet {
            productCardView.delegate = delegate
        }
    }

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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(productCardView)
        addSubview(productNameLabel)
        addSubview(quantityLabel)
        addSubview(sizeLabel)
    }

    private func setupConstraints() {
        productCardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productCardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        productCardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.productNameLabelPaddingTop)
            .isActive = true
        productNameLabel.leadingAnchor.constraint(
            equalTo: productCardView.trailingAnchor,
            constant: Constants.productCardViewPaddingRight
        ).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        quantityLabel.topAnchor.constraint(
            equalTo: productNameLabel.bottomAnchor,
            constant: Constants.quantityPaddingTop
        ).isActive = true
        quantityLabel.leadingAnchor.constraint(
            equalTo: productCardView.trailingAnchor,
            constant: Constants.productCardViewPaddingRight
        ).isActive = true
        sizeLabel.topAnchor.constraint(
            equalTo: quantityLabel.bottomAnchor,
            constant: Constants.sizeLabelPaddingTop
        ).isActive = true
        sizeLabel.leadingAnchor.constraint(
            equalTo: productCardView.trailingAnchor,
            constant: Constants.productCardViewPaddingRight
        ).isActive = true
    }

    private func makeProductDescriptionLabel(withText text: String = "") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .verdana(ofSize: Constants.productDescriptionLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
