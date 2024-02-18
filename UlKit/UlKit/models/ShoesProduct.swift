// ShoesProduct.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель товара "обувь"
final class ShoesProduct: Product {
    var size: Int?
    let availableSizes: [Int]

    init(name: String, image: String, price: Int, availableSizes: [Int], size: Int? = nil) {
        self.availableSizes = availableSizes
        self.size = size
        super.init(name: name, image: image, price: price)
    }
}
