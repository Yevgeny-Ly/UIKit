// FeedRecommendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки рекомендаций
final class FeedRecommendationsViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var spacingX: CGFloat = 10
        static var fontVerdana = "Verdana"
        static var fontVerdanaBold = "Verdana-Bold"
        static var labelRecommendations = "Рекомендуем вам"
        static var labelSubscribe = "Подписаться"
        static let labelAllRecommend = "Все"
    }

    // MARK: - Visual Components

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelRecommendations
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allRecommendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 8)
        button.setTitle(Constants.labelAllRecommend, for: .normal)
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
        super.init(coder: coder)
        addView()
        setupConstraints()
    }

    // MARK: - Public Methods

    func configure(with data: [RecommendationsCellSource]) {
        var totalWidth: CGFloat = Constants.spacingX

        for item in data {
            let backgroundPanelView = createBackgroundPanelView()
            let imageProfile = createImageProfile(image: item.imageUser)
            let nicknameLabel = createNicknameLabel(text: item.nameUser)
            let subscriptionButton = createSubscriptionButton()

            addSubviewsToScrollView(backgroundPanelView, imageProfile)
            addSubviewsToBackgroundPanelView(backgroundPanelView, nicknameLabel, subscriptionButton)

            setConstraintsForBackgroundPanelView(backgroundPanelView, scrollView, totalWidth)
            setConstraintsForImageProfile(imageProfile, backgroundPanelView, nicknameLabel)
            setConstraintsForNicknameLabel(nicknameLabel, imageProfile)
            setConstraintsForSubscriptionButton(subscriptionButton, nicknameLabel)

            totalWidth += 200 + Constants.spacingX
        }
        scrollView.contentSize = CGSize(width: totalWidth, height: 0)
    }

    // MARK: - Private Methods

    private func createBackgroundPanelView() -> UIView {
        let backgroundPanelView = UIView()
        backgroundPanelView.backgroundColor = .white
        backgroundPanelView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundPanelView
    }

    private func createImageProfile(image: String) -> UIImageView {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: image)
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        return imageProfile
    }

    private func createNicknameLabel(text: String) -> UILabel {
        let nicknameLabel = UILabel()
        nicknameLabel.text = text
        nicknameLabel.font = UIFont(name: Constants.fontVerdana, size: 10)
        nicknameLabel.textAlignment = .center
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nicknameLabel
    }

    private func createSubscriptionButton() -> UIButton {
        let subscriptionButton = UIButton(type: .system)
        subscriptionButton.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        subscriptionButton.setTitle(Constants.labelSubscribe, for: .normal)
        subscriptionButton.setTitleColor(.white, for: .normal)
        subscriptionButton.layer.cornerRadius = 8
        subscriptionButton.backgroundColor = .buttonSubscription
        subscriptionButton.translatesAutoresizingMaskIntoConstraints = false
        return subscriptionButton
    }

    private func addSubviewsToScrollView(_ views: UIView...) {
        for view in views {
            scrollView.addSubview(view)
        }
    }

    private func addSubviewsToBackgroundPanelView(_ backgroundPanelView: UIView, _ subviews: UIView...) {
        for view in subviews {
            backgroundPanelView.addSubview(view)
        }
    }

    private func addSubviewsToBackgroundPanelView(_ backgroundPanelView: UIView, subviews: [UIView]) {
        for view in subviews {
            backgroundPanelView.addSubview(view)
        }
    }

    private func setConstraintsForBackgroundPanelView(
        _ backgroundPanelView: UIView,
        _ scrollView: UIScrollView,
        _ totalWidth: CGFloat
    ) {
        backgroundPanelView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        backgroundPanelView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: totalWidth).isActive = true
        backgroundPanelView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        backgroundPanelView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setConstraintsForImageProfile(
        _ imageProfile: UIImageView,
        _ backgroundPanelView: UIView,
        _ nicknameLabel: UILabel
    ) {
        imageProfile.topAnchor.constraint(equalTo: backgroundPanelView.topAnchor, constant: 10).isActive = true
        imageProfile.centerXAnchor.constraint(equalTo: backgroundPanelView.centerXAnchor).isActive = true
        imageProfile.widthAnchor.constraint(equalToConstant: 115).isActive = true
        imageProfile.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func setConstraintsForNicknameLabel(_ nicknameLabel: UILabel, _ imageProfile: UIImageView) {
        nicknameLabel.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 10).isActive = true
        nicknameLabel.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor).isActive = true
    }

    private func setConstraintsForSubscriptionButton(_ subscriptionButton: UIButton, _ nicknameLabel: UILabel) {
        subscriptionButton.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 10).isActive = true
        subscriptionButton.centerXAnchor.constraint(equalTo: nicknameLabel.centerXAnchor).isActive = true
        subscriptionButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscriptionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

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
