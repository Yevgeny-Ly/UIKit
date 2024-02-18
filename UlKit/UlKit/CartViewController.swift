// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран корзины
final class CartViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let screenTitle = "Корзина"
        static let orderButtonText = "Оформить заказ -"
        static let currencyText = "₽"
        static let cartItemViewPadding = 20.0
        static let cartItemViewHeight = 157.0
        static let confirmOrderButtonSpacing = (x: 20.0, y: 34.0)

        static let cartItemsMock: [CartItem] = [
            CartItem(product: ShoesProduct(
                name: "Женские ботинки",
                image: "shoes",
                price: 4250,
                availableSizes: [35, 36, 37, 38, 39],
                size: 36
            )),
            CartItem(product: ShoesProduct(
                name: "Туфли женские ",
                image: "shoes",
                price: 3500,
                availableSizes: [34, 39, 40],
                size: 34
            ))
        ]
    }

    // MARK: - Visual Components

    private let confirmOrderButton = PrimaryButton()

    // MARK: - Public Properties

    var cartItems = [CartItem]() {
        didSet {
            isConfirmOrderButtonEnabled = !cartItems.isEmpty
            cartSum = cartItems.reduce(0) { $0 + $1.quantity * $1.product.price }
            layoutCartItems()
        }
    }

    // MARK: - Private Properties

    private var cartItemViews = [CartItemView]()
    private var isConfirmOrderButtonEnabled = false {
        didSet {
            confirmOrderButton.isHidden = !isConfirmOrderButtonEnabled
        }
    }

    private var cartSum = 0 {
        didSet {
            confirmOrderButton.setTitle(
                "\(Constants.orderButtonText) \(cartSum) \(Constants.currencyText)",
                for: .normal
            )
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        title = Constants.screenTitle
//        cartItems = Constants.cartItemsMock

        for cartItem in cartItems {
            let cartItemView = CartItemView(cartItem: cartItem)
            cartItemView.cartItem = cartItem
            view.addSubview(cartItemView)
            cartItemViews.append(cartItemView)
            cartItemView.delegate = self
        }
        view.addSubview(confirmOrderButton)
        setupConstraints()
    }

    private func setupConstraints() {
        layoutCartItems()

        confirmOrderButton.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constants.confirmOrderButtonSpacing.x
        )
        .isActive = true
        view.trailingAnchor.constraint(
            equalTo: confirmOrderButton.trailingAnchor,
            constant: Constants.confirmOrderButtonSpacing.x
        )
        .isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: confirmOrderButton.bottomAnchor,
            constant: Constants.confirmOrderButtonSpacing.y
        ).isActive = true
    }

    private func layoutCartItems() {
        var previousCartItemView: CartItemView?
        for (index, cartItemView) in cartItemViews.enumerated() {
            cartItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.cartItemViewPadding)
                .isActive = true
            view.trailingAnchor
                .constraint(equalTo: cartItemView.trailingAnchor, constant: Constants.cartItemViewPadding)
                .isActive = true
            cartItemView.heightAnchor.constraint(equalToConstant: Constants.cartItemViewHeight).isActive = true

            if index == 0 {
                cartItemView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: Constants.cartItemViewPadding
                ).isActive = true
            }
            if let previousCartItemView {
                cartItemView.topAnchor.constraint(
                    equalTo: previousCartItemView.bottomAnchor,
                    constant: Constants.cartItemViewPadding
                ).isActive = true
            }

            previousCartItemView = cartItemView
        }
    }
}

extension CartViewController: CartItemViewDelegate {
    func deleteItemFromCart(_ cartItemView: CartItemView, cartItemId id: CartItem.ID) {
        cartItems = cartItems.filter { $0.id != id }
        cartItemViews = cartItemViews.filter { $0 != cartItemView }
        cartItemView.removeFromSuperview()
        layoutCartItems()
    }
}

extension CartViewController: DetailsShoesViewControllerDelegate {
    func acceptInfo(_ from: DetailsShoesViewController, product: Product) {
        cartItems.append(CartItem(product: product, quantity: 1))
    }
}
