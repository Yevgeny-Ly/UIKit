// ShoesProduct.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель товара "обувь"
final class ShoesProduct: Product {
    var size: Int?
    let availableSizes: [Int]

    init(name: String, image: String, price: Int, availableSizes: [Int]) {
        self.availableSizes = availableSizes
        super.init(name: name, image: image, price: price)
    }
}
