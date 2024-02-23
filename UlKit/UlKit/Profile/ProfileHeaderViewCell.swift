// ProfileHeaderViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Ячейка для шапки таблицы
final class ProfileHeaderViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let sizeFontSmall: CGFloat = 10
        static let sizeFontBig: CGFloat = 14
        static let fontVerdana = "Verdana"
        static let fontVerdanaBold = "Verdana-Bold"
        static let link = "www.spacex.com"
        static let labelPublication = "\n публикации"
        static let labelSubscribers = "\n подписчики"
        static let labelSubscriptions = "\n подписки"
        static let labelModify = "Изменить"
        static let labelShareProfile = "Поделиться профилем"
    }

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .girl
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addProfilePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.addStoryButton, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bioUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: Constants.sizeFontBig)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.link, for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.sizeFontBig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickLinkButtonHandler), for: .touchUpInside)
        return button
    }()

    private let publicationsNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var publicationsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.labelPublication, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let subscribersNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subscribersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.labelSubscribers, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let subscriptionsNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var subscriptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.labelSubscriptions, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let changesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.labelModify, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontSmall)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.labelShareProfile, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontSmall)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let addPersonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.addPersonIcon, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 8
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Properties

    static let identifier = NSStringFromClass(ProfileHeaderViewCell.self)

    // MARK: - Private Properties

    private var webView: WKWebView?
    private var pageLink: URL?
    private var presentWebViewClosure: ((URL) -> Void)?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setupConstraints()
    }

    // MARK: - Public Methods

    func configure(link: String, _ info: ProfileInfo, presentWebViewClosure: @escaping (URL) -> Void) {
        userImageView.image = UIImage(named: info.avatarName)
        userNameLabel.text = info.userName
        bioUserLabel.text = info.bioPerson
        publicationsNumberLabel.text = String(info.postsNumber)
        subscribersNumberLabel.text = String(info.subscribersNumber)
        subscriptionsNumberLabel.text = String(info.subscriptionsNumber)

        if let url = URL(string: link) {
            pageLink = url
        }
        self.presentWebViewClosure = presentWebViewClosure
        let button = UIButton()
        button.addTarget(self, action: #selector(clickLinkButtonHandler), for: .touchUpInside)
        contentView.addSubview(button)
    }

    // MARK: - Private Methods

    private func addViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(addProfilePhotoButton)
        contentView.addSubview(bioUserLabel)
        contentView.addSubview(linkButton)
        contentView.addSubview(publicationsNumberLabel)
        contentView.addSubview(publicationsButton)
        contentView.addSubview(subscribersNumberLabel)
        contentView.addSubview(subscribersButton)
        contentView.addSubview(subscriptionsNumberLabel)
        contentView.addSubview(subscriptionsButton)
        contentView.addSubview(changesButton)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addPersonButton)
    }

    private func setupConstraints() {
        setupUserImageViewConstraints()
        setupAddProfilePhotoButtonConstraints()
        setupUserNameLabelConstraints()
        setupStatusUserLabelConstraints()
        setupLinkLabelConstraints()
        setupPublicationsNumberConstraints()
        setupPublicationsButtonConstraints()
        setupSubscribeNumberConstraints()
        setupSubscribersButtonConstraints()
        setupSubscriptionsNumberConsstraints()
        setupSubscriptionsButtonConstraints()
        setupChangesButtonConstraints()
        setupShareProfileButtonConstraints()
        setupAddPersonButtonConstraints()
    }

    private func setupUserImageViewConstraints() {
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        userImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupAddProfilePhotoButtonConstraints() {
        addProfilePhotoButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: -20).isActive = true
        addProfilePhotoButton.rightAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 1).isActive = true
        addProfilePhotoButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        addProfilePhotoButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }

    private func setupUserNameLabelConstraints() {
        userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupStatusUserLabelConstraints() {
        bioUserLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10).isActive = true
        bioUserLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        bioUserLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        bioUserLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func setupLinkLabelConstraints() {
        linkButton.topAnchor.constraint(equalTo: bioUserLabel.bottomAnchor, constant: 10).isActive = true
        linkButton.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        linkButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        linkButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupPublicationsNumberConstraints() {
        publicationsNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        publicationsNumberLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 55).isActive = true
        publicationsNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        publicationsNumberLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupPublicationsButtonConstraints() {
        publicationsButton.topAnchor.constraint(equalTo: publicationsNumberLabel.bottomAnchor, constant: 5)
            .isActive = true
        publicationsButton.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 45).isActive = true
        publicationsButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        publicationsButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscribeNumberConstraints() {
        subscribersNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        subscribersNumberLabel.leftAnchor.constraint(equalTo: publicationsNumberLabel.rightAnchor, constant: 25)
            .isActive = true
        subscribersNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribersNumberLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscribersButtonConstraints() {
        subscribersButton.topAnchor.constraint(equalTo: subscribersNumberLabel.bottomAnchor, constant: 5)
            .isActive = true
        subscribersButton.leftAnchor.constraint(equalTo: publicationsButton.rightAnchor, constant: 5).isActive = true
        subscribersButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscriptionsNumberConsstraints() {
        subscriptionsNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        subscriptionsNumberLabel.leftAnchor.constraint(equalTo: subscribersNumberLabel.rightAnchor, constant: 25)
            .isActive = true
        subscriptionsNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscriptionsNumberLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupSubscriptionsButtonConstraints() {
        subscriptionsButton.topAnchor.constraint(equalTo: subscriptionsNumberLabel.bottomAnchor, constant: 5)
            .isActive = true
        subscriptionsButton.leftAnchor.constraint(equalTo: subscribersButton.rightAnchor, constant: 5).isActive = true
        subscriptionsButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupChangesButtonConstraints() {
        changesButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 15).isActive = true
        changesButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        changesButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changesButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setupShareProfileButtonConstraints() {
        shareProfileButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 15).isActive = true
        shareProfileButton.leftAnchor.constraint(equalTo: changesButton.rightAnchor, constant: 5).isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setupAddPersonButtonConstraints() {
        addPersonButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 15).isActive = true
        addPersonButton.leftAnchor.constraint(equalTo: shareProfileButton.rightAnchor, constant: 5).isActive = true
        addPersonButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addPersonButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    @objc
    private func clickLinkButtonHandler() {
        if let url = pageLink,
           let presentWebViewClosure = presentWebViewClosure
        {
            presentWebViewClosure(url)
        }
    }
}
