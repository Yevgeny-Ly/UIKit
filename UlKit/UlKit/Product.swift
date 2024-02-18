// Product.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель товара
class Product {
    var name: String
    var image: String
    var price: Int

    init(name: String, image: String, price: Int) {
        self.name = name
        self.image = image
        self.price = price
    }
}
