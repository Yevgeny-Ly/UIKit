// Product.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель товара
class Product {
    let name: String
    let image: String
    let price: Int

    init(name: String, image: String, price: Int) {
        self.name = name
        self.image = image
        self.price = price
    }
}
