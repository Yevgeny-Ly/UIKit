// ProfileFeedViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки ленты профиля
final class ProfileFeedViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()

    // MARK: - Public Properties

    var feedSources: [ProfileFeedCellSource] = []
    static let identifier = NSStringFromClass(ProfileFeedViewCell.self)

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setupConstraints()
        setupCollectionView()
    }

    // MARK: - Public Methods

    func configure(with data: [ProfileFeedCellSource]) {
        feedSources = data
    }

    // MARK: - Private Methods

    private func setupCollectionView() {
        collectionView.register(
            ProfileFeedCollectionCell.self,
            forCellWithReuseIdentifier: "ProfileFeedCell"
        )
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func addViews() {
        contentView.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}

// MARK: - Подписываюсь на Data Source для коллекции

extension ProfileFeedViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        feedSources.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProfileFeedCell",
            for: indexPath
        ) as? ProfileFeedCollectionCell else {
            return UICollectionViewCell()
        }

        let feedSource = feedSources[indexPath.row]
        cell.imageView.image = UIImage(named: feedSource.postImage)

        return cell
    }
}

// MARK: - Подписываюсь на Delegate отображения ячеек коллекции

extension ProfileFeedViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let itemSize = (collectionView.bounds.width) / 3
        return CGSize(width: itemSize, height: itemSize)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }
}
