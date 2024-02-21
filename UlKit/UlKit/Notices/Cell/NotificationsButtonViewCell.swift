// NotificationsButtonViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки с кнопкой
class NotificationsButtonViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var fontVerdana = "Verdana"
        static var fontVerdanaBold = "Verdana-Bold"
    }

    // MARK: - Visual Components

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subscribeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonSubscription
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(NotificationsButtonViewCell.self)

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configurationCell(data: ButtonCellSource) {
        avatarImageView.image = data.avatar
        subscribeButton.setTitle(data.buttonTitle, for: .normal)

        if let comment = data.comment {
            customizesLabel(with: comment)
        }
    }

    // MARK: - Private Methods

    private func customizesLabel(with comment: CommentInformation) {
        let string = comment.nameUser + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.nameUser.count)
        attributedString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.boldSystemFont(ofSize: 12),
            range: range
        )
        commentLabel.attributedText = attributedString
    }

    private func addViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(commentLabel)
        contentView.addSubview(subscribeButton)
    }

    private func setupConstraints() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        commentLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10).isActive = true
        commentLabel.rightAnchor.constraint(equalTo: subscribeButton.leftAnchor, constant: -15).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        subscribeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subscribeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
