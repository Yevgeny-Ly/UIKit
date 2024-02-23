// ProfileStoriesViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка историй
final class ProfileStoriesViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var spacingX: CGFloat = 10
        static var fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(ProfileStoriesViewCell.self)

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

    func configure(with info: [PostStoriesCellSource]) {
        var previousView: UIView?
        let imageWidth: CGFloat = 80
        let spacing: CGFloat = 20
        let contentHeight: CGFloat = 100
        var contentWidth: CGFloat = Constants.spacingX

        for item in info {
            let userImage = UIImageView()
            userImage.image = UIImage(named: item.avatarImage)
            userImage.contentMode = .scaleAspectFit
            userImage.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(userImage)

            let nickNameLabel = UILabel()
            nickNameLabel.text = item.nameUser
            nickNameLabel.font = UIFont(name: Constants.fontVerdana, size: 16)
            nickNameLabel.textAlignment = .center
            nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(nickNameLabel)

            userImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            userImage.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
            userImage.heightAnchor.constraint(equalToConstant: imageWidth).isActive = true
            if let previousView {
                userImage.leftAnchor.constraint(equalTo: previousView.rightAnchor, constant: spacing).isActive = true
            } else {
                userImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: contentWidth).isActive = true
            }

            nickNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor).isActive = true
            nickNameLabel.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
            nickNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
            nickNameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor).isActive = true

            contentWidth += imageWidth + spacing
            previousView = userImage
        }

        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
    }

    // MARK: - Private Methods

    private func addView() {
        contentView.addSubview(scrollView)
    }

    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
