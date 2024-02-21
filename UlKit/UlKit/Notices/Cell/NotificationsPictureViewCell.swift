// NotificationsPictureViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки c изображением поста
final class NotificationsPictureViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var fontVerdana = "Verdana"
        static var fontSize: CGFloat = 12
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: Constants.fontSize)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(NotificationsPictureViewCell.self)

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

    func configurationCell(data: PictureCellSource) {
        avatarImageView.image = data.avatar
        postImageView.image = data.image

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
            value: UIFont.boldSystemFont(ofSize: Constants.fontSize),
            range: range
        )
        commentLabel.attributedText = attributedString
    }

    private func addViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(commentLabel)
        contentView.addSubview(postImageView)
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
        commentLabel.rightAnchor.constraint(equalTo: postImageView.leftAnchor, constant: -45).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        postImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}
