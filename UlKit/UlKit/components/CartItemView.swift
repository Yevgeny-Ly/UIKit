// CartItemView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Панель продукта в корзине
final class CartItemView: UIView {
    // MARK: - Constants

    enum Constants {
        static let quantityLabelText = "Количество"
        static let sizeLabelText = "Размер"
        static let priceLabelText = "Цена"
        static let currencyText = "\u{20bd}"
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

    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var productNameLabel = makeProductDescriptionLabel()
    private lazy var quantityLabel = makeProductDescriptionLabel(withText: Constants.quantityLabelText)
    private lazy var sizeLabel = makeProductDescriptionLabel(withText: Constants.sizeLabelText)
    private lazy var priceLabel = makeProductDescriptionLabel(withText: Constants.priceLabelText)

    private let quantityStepper = QuantityStepperControl()

    // MARK: - Public Properties

    var cartItem: CartItem? {
        didSet {
            if let cartItem {
                productCardView.productImage = UIImage(named: cartItem.product.image)
                productNameLabel.text = cartItem.product.name
                quantityStepper.value = cartItem.quantity
                priceValueLabel.text = "\(cartItem.product.price) \(Constants.currencyText)"
            }
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
        addSubview(quantityStepper)
        addSubview(priceLabel)
        addSubview(priceValueLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productCardView.topAnchor.constraint(equalTo: topAnchor),
            productCardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.productNameLabelPaddingTop),
            productNameLabel.leadingAnchor.constraint(
                equalTo: productCardView.trailingAnchor,
                constant: Constants.productCardViewPaddingRight
            ),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            quantityLabel.topAnchor.constraint(
                equalTo: productNameLabel.bottomAnchor,
                constant: Constants.quantityPaddingTop
            ),
            quantityLabel.leadingAnchor.constraint(
                equalTo: productCardView.trailingAnchor,
                constant: Constants.productCardViewPaddingRight
            ),
            quantityStepper.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            quantityStepper.trailingAnchor.constraint(equalTo: trailingAnchor),
            sizeLabel.topAnchor.constraint(
                equalTo: quantityLabel.bottomAnchor,
                constant: Constants.sizeLabelPaddingTop
            ),
            sizeLabel.leadingAnchor.constraint(
                equalTo: productCardView.trailingAnchor,
                constant: Constants.productCardViewPaddingRight
            ),

            priceLabel.leadingAnchor.constraint(
                equalTo: productCardView.trailingAnchor,
                constant: Constants.productCardViewPaddingRight
            ),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func makeProductDescriptionLabel(withText text: String = "") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .verdana(ofSize: Constants.productDescriptionLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
