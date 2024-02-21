// FeedRecommendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка для ячейки рекомендаций
final class FeedRecommendationsViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var spacingX: CGFloat = 10
        static var fontVerdana = "Verdana"
        static var fontVerdanaBold = "Verdana-Bold"
    }

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.text = "Рекомендуем вам"
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allRecommendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 8)
        button.setTitle("Все", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(FeedRecommendationsViewCell.self)

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configurationCellRecommendations(data: [RecommendationsCellSource]) {
        var totalWidth: CGFloat = Constants.spacingX
        for item in data {
            let backgroundPanelView = UIView()
            backgroundPanelView.backgroundColor = .white
            backgroundPanelView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(backgroundPanelView)

            let imageProfile = UIImageView()
            imageProfile.image = item.image
            imageProfile.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(imageProfile)

            let nicknameLabel = UILabel()
            nicknameLabel.text = item.nameUser
            nicknameLabel.font = UIFont(name: Constants.fontVerdana, size: 10)
            nicknameLabel.textAlignment = .center
            nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
            backgroundPanelView.addSubview(nicknameLabel)

            let subscriptionButton = UIButton(type: .system)
            subscriptionButton.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
            subscriptionButton.setTitle("Подписаться", for: .normal)
            subscriptionButton.setTitleColor(.white, for: .normal)
            subscriptionButton.layer.cornerRadius = 8
            subscriptionButton.backgroundColor = .buttonSubscription
            subscriptionButton.translatesAutoresizingMaskIntoConstraints = false
            backgroundPanelView.addSubview(subscriptionButton)

            backgroundPanelView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
            backgroundPanelView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: totalWidth)
                .isActive = true
            backgroundPanelView.widthAnchor.constraint(equalToConstant: 185).isActive = true
            backgroundPanelView.heightAnchor.constraint(equalToConstant: 200).isActive = true

            totalWidth += 200 + Constants.spacingX

            imageProfile.topAnchor.constraint(equalTo: backgroundPanelView.topAnchor, constant: 10).isActive = true
            imageProfile.centerXAnchor.constraint(equalTo: backgroundPanelView.centerXAnchor).isActive = true
            imageProfile.widthAnchor.constraint(equalToConstant: 115).isActive = true
            imageProfile.heightAnchor.constraint(equalToConstant: 115).isActive = true

            nicknameLabel.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 10).isActive = true
            nicknameLabel.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor).isActive = true

            subscriptionButton.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 10).isActive = true
            subscriptionButton.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor).isActive = true
            subscriptionButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
            subscriptionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

            scrollView.contentSize = CGSize(width: totalWidth, height: 0)
        }
    }

    // MARK: - Private Methods

    private func addView() {
        backgroundColor = .backgroundRecommendations
        contentView.addSubview(recommendLabel)
        contentView.addSubview(allRecommendButton)
        contentView.addSubview(scrollView)
    }

    private func setupConstraints() {
        recommendLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        recommendLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true

        allRecommendButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        allRecommendButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true

        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
