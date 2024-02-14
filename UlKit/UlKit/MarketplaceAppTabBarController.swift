// MarketplaceAppTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// TabBarController для приложения Marketplace с основными экранами: Каталог, Корзина, Профиль
final class MarketplaceAppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        viewControllers = [
            createCatalogNavigationController(),
            createCartNavigationController(),
            createProfileNavigationController()
        ]
        UITabBar.appearance().tintColor = .pinkMain
        UITabBarItem.appearance().setTitleTextAttributes(
            [.font: UIFont.verdana(ofSize: 10) ?? UIFont.systemFont(ofSize: 10)],
            for: .normal
        )
    }

    private func createCatalogNavigationController() -> UINavigationController {
        let catalogViewController = CatalogViewController()
        let catalogNavigationController = UINavigationController(rootViewController: catalogViewController)
        catalogNavigationController.tabBarItem = UITabBarItem(title: "Каталог", image: .catalogBarItem, tag: 0)
        return catalogNavigationController
    }

    private func createCartNavigationController() -> UINavigationController {
        let cartViewController = CartViewController()
        let cartNavigationController = UINavigationController(rootViewController: cartViewController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Корзина", image: .cartBarIcon, tag: 1)
        return cartNavigationController
    }

    private func createProfileNavigationController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: .profileBarItem, tag: 2)
        return profileNavigationController
    }
}
