// CartItem.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель продукта в корзине
final class CartItem {
    let product: Product
    let maxQuantity: Int?
    private(set) var quantity = 0

    init(product: Product, quantity: Int = 0, maxQuantity: Int? = nil) {
        self.product = product
        self.quantity = quantity
        self.maxQuantity = maxQuantity
    }

    func addOne() {
        if quantity != maxQuantity {
            quantity += 1
        }
    }

    func removeOne() {
        if quantity > 1 {
            quantity -= 1
        }
    }
}
