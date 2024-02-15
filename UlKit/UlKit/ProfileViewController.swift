// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля юзера
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let screenTitle = "Профиль"
        static let personalDataLabelText = "Личные данные"
        static let myDataButtonText = "Мои данные"
        static let inviteFriendButtonText = "Приведи друга"
        static let feedbackButtonText = "Обратная связь"
        static let discountCardPadding = (x: 20.0, y: 25.0)
        static let personalDataSectionPadding = (x: 20.0, y: 28.0)
        static let settingsButtonsSpacing = 15.0
        static let personalDataLabelSize = 16.0
    }

    // MARK: - Visual Components

    private let discountCardView = DiscountCardView()
    private lazy var personalDataLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.personalDataLabelText
        label.font = .verdanaBold(ofSize: Constants.personalDataLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var personalDataSectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var myDataButton: UIButton = {
        let button = SettingsButton()
        button.title = Constants.myDataButtonText
        button.image = .myProfileIcon
        button.addTarget(self, action: #selector(openProfileSettings), for: .touchUpInside)
        return button
    }()

    private lazy var inviteFriendButton: UIButton = {
        let button = SettingsButton()
        button.title = Constants.inviteFriendButtonText
        button.image = .userHeartIcon
        return button
    }()

    private lazy var feedbackButton: UIButton = {
        let button = SettingsButton()
        button.title = Constants.feedbackButtonText
        button.image = .feedbackIcon
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        title = Constants.screenTitle
        view.addSubview(discountCardView)
        personalDataSectionView.addSubview(personalDataLabel)
        personalDataSectionView.addSubview(myDataButton)
        personalDataSectionView.addSubview(inviteFriendButton)
        personalDataSectionView.addSubview(feedbackButton)
        view.addSubview(personalDataSectionView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            discountCardView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.discountCardPadding.y
            ),
            discountCardView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.discountCardPadding.x
            ),
            view.trailingAnchor.constraint(
                equalTo: discountCardView.trailingAnchor,
                constant: Constants.discountCardPadding.x
            ),
            personalDataSectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.personalDataSectionPadding.x
            ),
            view.trailingAnchor.constraint(
                equalTo: personalDataSectionView.trailingAnchor,
                constant: Constants.personalDataSectionPadding.x
            ),
            personalDataSectionView.topAnchor.constraint(
                equalTo: discountCardView.bottomAnchor,
                constant: Constants.personalDataSectionPadding.y
            ),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(
                equalTo: personalDataSectionView.bottomAnchor,
                constant: Constants.personalDataSectionPadding.y
            ),
            personalDataLabel.leadingAnchor.constraint(equalTo: personalDataSectionView.leadingAnchor),
            personalDataLabel.trailingAnchor.constraint(equalTo: personalDataSectionView.trailingAnchor),
            personalDataLabel.topAnchor.constraint(equalTo: personalDataSectionView.topAnchor)
        ])

        var previousSettingsButton: UIButton?
        for button in [myDataButton, inviteFriendButton, feedbackButton] {
            if let previousSettingsButton {
                button.topAnchor.constraint(
                    equalTo: previousSettingsButton.bottomAnchor,
                    constant: Constants.settingsButtonsSpacing
                ).isActive = true
            } else {
                button.topAnchor.constraint(
                    equalTo: personalDataLabel.bottomAnchor,
                    constant: Constants.settingsButtonsSpacing
                ).isActive = true
            }
            button.leadingAnchor.constraint(equalTo: personalDataSectionView.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: personalDataSectionView.trailingAnchor).isActive = true
            previousSettingsButton = button
        }
    }

    @objc private func openProfileSettings() {
        let profileViewController = UINavigationController(rootViewController: ProfileSettingsViewController())
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true)
    }
}
