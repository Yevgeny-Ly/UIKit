// CoffeeConfigurator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Конфигурация заказа кофе
struct CoffeeConfigurator {
    /// Параметры конфигурации с дефолтными значениями
    var coffeeType = CoffeType.americano
    var roasting = Roasting.dark
    var additions = [Addition]()

    private let basePrice = 100

    /// Вычисляемое значение цены на основе базовый цены кофе + цены допов
    var price: Int {
        additions.reduce(basePrice) { $0 + CoffeeConfigurator.additionsPriceMap[$1, default: 0] }
    }

    /// Таблица цен доп ингридиентов
    private static let additionsPriceMap = [
        Addition.milk: 50,
        .syrop: 20,
        .soyMink: 50,
        .almondMilk: 70,
        .extraShot: 50
    ]

    /// Варинты кофейных напитков
    enum CoffeType {
        case americano
        case capuccino
        case latte
    }

    /// Варианты обжарок зерен
    enum Roasting {
        case dark
        case light
    }

    /// Доступные дополнительные ингридиенты
    enum Addition {
        case milk
        case syrop
        case soyMink
        case almondMilk
        case extraShot
    }
}
