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
            createCatalogNavController(),
            createCartNavController(),
            createProfileNavController()
        ]
        UITabBar.appearance().tintColor = .pinkMain
        UITabBarItem.appearance().setTitleTextAttributes(
            [.font: UIFont.verdana(ofSize: 10) ?? UIFont.systemFont(ofSize: 10)],
            for: .normal
        )
    }

    private func createCatalogNavController() -> UINavigationController {
        let catalogVC = CatalogViewController()
        let catalogNC = UINavigationController(rootViewController: catalogVC)
        catalogNC.tabBarItem = UITabBarItem(title: "Каталог", image: .catalogBarItem, tag: 0)
        return catalogNC
    }

    private func createCartNavController() -> UINavigationController {
        let cartVC = CartViewController()
        let cartNC = UINavigationController(rootViewController: cartVC)
        cartNC.tabBarItem = UITabBarItem(title: "Корзина", image: .cartBarIcon, tag: 1)
        return cartNC
    }

    private func createProfileNavController() -> UINavigationController {
        let profileVC = ProfileViewController()
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileNC.tabBarItem = UITabBarItem(title: "Профиль", image: .profileBarItem, tag: 2)
        return profileNC
    }
}
