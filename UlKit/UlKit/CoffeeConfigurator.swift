// CoffeeConfigurator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Конфигурация заказа кофе
struct CoffeeConfigurator {
    /// Параметры конфигурации с дефолтными значениями
    var coffeeType = CoffeType.americano
    var roasting = Roasting.dark
    var additions = [Addition]()

    let basePrice = 100

    /// Вычисляемое значение цены на основе базовый цены кофе + цены допов
    var price: Int {
        additions.reduce(basePrice) { $0 + CoffeeConfigurator.additionsPriceMap[$1, default: 0] }
    }

    /// Таблица цен доп ингридиентов
    static let additionsPriceMap = [
        Addition.milk: 50,
        .syrop: 20,
        .soyMilk: 50,
        .almondMilk: 70,
        .extraShot: 50
    ]

    /// Варинты кофейных напитков
    enum CoffeType: String, CaseIterable {
        case americano = "Американо"
        case capuccino = "Капучино"
        case latte = "Латте"
    }

    /// Варианты обжарок зерен
    enum Roasting: CaseIterable {
        case dark
        case light
    }

    /// Доступные дополнительные ингридиенты
    enum Addition: String, CaseIterable {
        case milk = "Молоко"
        case syrop = "Сироп"
        case soyMilk = "Молоко соевое"
        case almondMilk = "Молоко миндальное"
        case extraShot = "Эспрессо 50мл"
    }
}
