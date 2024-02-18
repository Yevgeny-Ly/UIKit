// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        setupNavigationBarTitleAppearance()
        window?.rootViewController = MarketplaceAppTabBarController()
        window?.makeKeyAndVisible()
    }

    private func setupNavigationBarTitleAppearance() {
        UINavigationBar.appearance()
            .titleTextAttributes = [.font: UIFont.verdanaBold(ofSize: 16) ?? UIFont.boldSystemFont(ofSize: 16)]
    }
}
