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
        static let labelNamePerson = "Мария Иванова"
        static let labelStatusUser = "Консультант"
        static let link = "www.spacex.com"
        static let labeQuantitylPublication = "67"
        static let labelPublication = "\n публикации"
        static let labeQuantitylSubscribers = "458"
        static let labelSubscribers = "\n подписчики"
        static let labeQuantitylSubscriptions = "120"
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
        label.text = Constants.labelNamePerson
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

    private let statusUserLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelStatusUser
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
        button.addTarget(self, action: #selector(handlesClickLinkButton), for: .touchUpInside)
        return button
    }()

    private lazy var publicationsButton: UIButton = {
        let button = UIButton(type: .system)

        let numberPublications = NSMutableAttributedString(string: Constants.labeQuantitylPublication, attributes: [
            .font: UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig) ?? UIFont(),
            .foregroundColor: UIColor.black
        ])

        let publicationsText = NSMutableAttributedString(string: Constants.labelPublication, attributes: [
            .font: UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall) ?? UIFont(),
            .foregroundColor: UIColor.gray
        ])

        numberPublications.append(publicationsText)
        button.setAttributedTitle(numberPublications, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var subscribersButton: UIButton = {
        let button = UIButton(type: .system)

        let numberSubscribers = NSMutableAttributedString(string: Constants.labeQuantitylSubscribers, attributes: [
            .font: UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig) ?? UIFont(),
            .foregroundColor: UIColor.black
        ])

        let subscribersText = NSMutableAttributedString(string: Constants.labelSubscribers, attributes: [
            .font: UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall) ?? UIFont(),
            .foregroundColor: UIColor.gray
        ])

        numberSubscribers.append(subscribersText)
        button.setAttributedTitle(numberSubscribers, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var subscriptionsButton: UIButton = {
        let button = UIButton(type: .system)

        let numberSubscriptions = NSMutableAttributedString(string: Constants.labeQuantitylSubscriptions, attributes: [
            .font: UIFont(name: Constants.fontVerdanaBold, size: Constants.sizeFontBig) ?? UIFont(),
            .foregroundColor: UIColor.black
        ])

        let subscriptionsText = NSMutableAttributedString(string: Constants.labelSubscriptions, attributes: [
            .font: UIFont(name: Constants.fontVerdana, size: Constants.sizeFontSmall) ?? UIFont(),
            .foregroundColor: UIColor.gray
        ])

        numberSubscriptions.append(subscriptionsText)
        button.setAttributedTitle(numberSubscriptions, for: .normal)
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

    private var presentWebViewClosure: (() -> Void) = {}

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

    func configure(presentWebViewClosure: @escaping () -> Void) {
        self.presentWebViewClosure = presentWebViewClosure
        let button = UIButton()
        button.addTarget(self, action: #selector(handlesClickLinkButton), for: .touchUpInside)
        contentView.addSubview(button)
    }

    // MARK: - Private Methods

    private func addViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(addProfilePhotoButton)
        contentView.addSubview(statusUserLabel)
        contentView.addSubview(linkButton)
        contentView.addSubview(publicationsButton)
        contentView.addSubview(subscribersButton)
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
        setupPublicationsButtonConstraints()
        setupSubscribersButtonConstraints()
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
        statusUserLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10).isActive = true
        statusUserLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        statusUserLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        statusUserLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func setupLinkLabelConstraints() {
        linkButton.topAnchor.constraint(equalTo: statusUserLabel.bottomAnchor, constant: 10).isActive = true
        linkButton.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        linkButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        linkButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupPublicationsButtonConstraints() {
        publicationsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        publicationsButton.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 45).isActive = true
        publicationsButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        publicationsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupSubscribersButtonConstraints() {
        subscribersButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        subscribersButton.leftAnchor.constraint(equalTo: publicationsButton.rightAnchor, constant: 5).isActive = true
        subscribersButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupSubscriptionsButtonConstraints() {
        subscriptionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        subscriptionsButton.leftAnchor.constraint(equalTo: subscribersButton.rightAnchor, constant: 5).isActive = true
        subscriptionsButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    private func handlesClickLinkButton() {
        presentWebViewClosure()
    }
}
