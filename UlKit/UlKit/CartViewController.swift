// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран корзины
final class CartViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let screenTitle = "Корзина"
        static let cartItemViewPadding = 20.0
        static let cartItemViewHeight = 157.0

        static let cartItemsMock: [CartItem] = [
            CartItem(product: Product(name: "Женские ботинки", image: "shoes", price: 4250)),
            CartItem(product: Product(name: "Туфли женские ", image: "shoes", price: 3500))
        ]
    }

    // MARK: - Public Properties

    var cartItems: [CartItem] = Constants.cartItemsMock

    // MARK: - Private Properties

    private var cartItemViews = [CartItemView]()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        title = Constants.screenTitle

        for cartItem in cartItems {
            let cartItemView = CartItemView()
            cartItemView.cartItem = cartItem
            view.addSubview(cartItemView)
            cartItemViews.append(cartItemView)
        }
        layoutCartItems()
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
