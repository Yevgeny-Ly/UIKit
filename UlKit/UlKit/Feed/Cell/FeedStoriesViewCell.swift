// FeedStoriesViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Настройка ячейки историй
final class FeedStoriesViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var spacingX: CGFloat = 10
        static var spacingNewUnits: CGFloat = 75
        static var heightContentSize: CGFloat = 100
        static var fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(FeedStoriesViewCell.self)

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

    func configure(with data: [StoriesCellSource]) {
        for item in data {
            let userImage = UIImageView()
            userImage.image = UIImage(named: item.avatarImage)
            userImage.contentMode = .scaleAspectFit
            userImage.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(userImage)

            let nickNameLabel = UILabel()
            nickNameLabel.text = item.nameUser
            nickNameLabel.font = UIFont(name: Constants.fontVerdana, size: 8)
            nickNameLabel.textAlignment = .center
            nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(nickNameLabel)

            if item.isAddStoriesButton {
                let addStoryButton = UIButton()
                addStoryButton.translatesAutoresizingMaskIntoConstraints = false
                addStoryButton.setImage(.addStoryButton, for: .normal)
                scrollView.addSubview(addStoryButton)

                addStoryButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: -15).isActive = true
                addStoryButton.leftAnchor.constraint(equalTo: userImage.leftAnchor, constant: 30).isActive = true
                addStoryButton.rightAnchor.constraint(equalTo: userImage.rightAnchor, constant: 1).isActive = true
            }

            userImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
            userImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Constants.spacingX)
                .isActive = true

            Constants.spacingX += Constants.spacingNewUnits

            nickNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10).isActive = true
            nickNameLabel.leftAnchor.constraint(equalTo: userImage.leftAnchor).isActive = true
            nickNameLabel.rightAnchor.constraint(equalTo: userImage.rightAnchor).isActive = true
        }
        scrollView.contentSize = CGSize(width: Constants.spacingX, height: Constants.heightContentSize)
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
