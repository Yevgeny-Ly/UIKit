// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

/// Настраивает tab bar
import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let titleTape = "Лента"
        static let titleNotices = "Уведомления"
        static let titleProfile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }

    // MARK: - Private Methods

    private func setupViewControllers() {
        viewControllers = [feedViewController(), noticesViewController(), profileViewController()]
    }

    private func feedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(
            title: Constants.titleTape,
            image: .feedOffIcon,
            selectedImage: .feedOnIcon
        )
        return UINavigationController(rootViewController: feedViewController)
    }

    private func noticesViewController() -> UINavigationController {
        let noticesViewController = NoticesViewController()
        noticesViewController.tabBarItem = UITabBarItem(
            title: Constants.titleNotices,
            image: .noticesOffIcon,
            selectedImage: .noticesOnIcon
        )
        return UINavigationController(rootViewController: noticesViewController)
    }

    private func profileViewController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: Constants.titleProfile,
            image: .profileOffIcon,
            selectedImage: .profileOffIcon
        )
        return UINavigationController(rootViewController: profileViewController)
    }
}
