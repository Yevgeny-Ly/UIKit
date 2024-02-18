// CartItemView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol CartItemViewDelegate: AnyObject {
    func deleteItemFromCart(_ cartItemView: CartItemView, cartItemId id: CartItem.ID)
}

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
        static let sizeLabelPaddingBottom = 10.0
        static let sizePickerPaddingBottom = 7.0
    }

    // MARK: - Visual Components

    private lazy var productCardView: ProductCardView = {
        let productCard = ProductCardView()
        productCard.isAddedToCart = true
        productCard.delegate = self
        return productCard
    }()

    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var sizePickerView: SizePickerView = {
        var availableSizes = [String]()
        if let shoesProduct = cartItem.product as? ShoesProduct {
            availableSizes = shoesProduct.availableSizes.map { "\($0)" }
        }
        let sizePicker = SizePickerView(availableSizes: availableSizes)
        return sizePicker
    }()

    private lazy var productNameLabel = makeProductDescriptionLabel()
    private lazy var quantityLabel = makeProductDescriptionLabel(withText: Constants.quantityLabelText)
    private lazy var sizeLabel = makeProductDescriptionLabel(withText: Constants.sizeLabelText)
    private lazy var priceLabel = makeProductDescriptionLabel(withText: Constants.priceLabelText)

    private let quantityStepper = QuantityStepperControl()

    // MARK: - Public Properties

    var cartItem: CartItem
    weak var delegate: CartItemViewDelegate?

    // MARK: - Initializers

    init(cartItem: CartItem) {
        self.cartItem = cartItem
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupView() {
        setupSubviews()

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(productCardView)
        addSubview(productNameLabel)
        addSubview(quantityLabel)
        addSubview(sizeLabel)
        addSubview(quantityStepper)
        addSubview(priceLabel)
        addSubview(priceValueLabel)
        addSubview(sizePickerView)
        setupConstraints()
    }

    private func setupSubviews() {
        productCardView.productImage = cartItem.product.image
        productNameLabel.text = cartItem.product.name
        quantityStepper.value = cartItem.quantity
        priceValueLabel.text = "\(cartItem.product.price) \(Constants.currencyText)"

        if let shoesProduct = cartItem.product as? ShoesProduct {
            if let size = shoesProduct.size {
                sizePickerView.selectedSize = "\(size)"
            }
        }
    }

    private func setupConstraints() {
        [
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
            priceValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            sizePickerView.leadingAnchor.constraint(
                equalTo: productCardView.trailingAnchor,
                constant: Constants.productCardViewPaddingRight
            ),
            trailingAnchor.constraint(equalTo: sizePickerView.trailingAnchor),
            sizePickerView.topAnchor.constraint(
                equalTo: sizeLabel.bottomAnchor,
                constant: Constants.sizeLabelPaddingBottom
            ),
            priceLabel.topAnchor.constraint(
                equalTo: sizePickerView.bottomAnchor,
                constant: Constants.sizePickerPaddingBottom
            )
        ].forEach { $0.isActive = true }
    }

    private func makeProductDescriptionLabel(withText text: String = "") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .verdana(ofSize: Constants.productDescriptionLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

extension CartItemView: ProductCardViewDelegate {
    func respondToCartButtonPress(_ productCardView: ProductCardView, product: Product) {
        delegate?.deleteItemFromCart(self, cartItemId: cartItem.id)
    }
}
