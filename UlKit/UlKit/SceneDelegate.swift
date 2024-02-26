// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        customizesScene(windowScene: windowScene)
    }

    func customizesScene(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        let viewController = ChoiceLayoutViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
