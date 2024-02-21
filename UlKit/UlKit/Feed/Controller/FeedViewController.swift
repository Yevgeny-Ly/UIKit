// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер табличного представления ленты
final class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let numberLikes = 201
        static let heightCellStories: CGFloat = 100
        static let heightCellPosts: CGFloat = 450
        static let heightCellRecommendations: CGFloat = 270
    }

    // MARK: - Visual Components

    private let rmLinkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.rmLink, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let messagesIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.messagesIcon, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let tableView = UITableView(frame: .zero, style: .plain)

    /// mock значения
    private lazy var rowsType: [FeedItemType] = [
        .stories([
            StoriesCellSource(
                avatarImage: "girl",
                nameUser: "Ваша история",
                isAddStoriesButton: true,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            ),
            StoriesCellSource(
                avatarImage: "girlAndLavender",
                nameUser: "lavanda123",
                isAddStoriesButton: false,
                isNewStory: false
            )
        ]),

        .post([PostCellSource(
            imageUser: "guyAndHorses",
            nameUser: "tur_v_dagestan",
            postImage: ["dagestanForest"],
            numberLikes: Constants.numberLikes,
            comment: CommentInfo(
                nameUser: "tur_v_dagestan",
                commentText: "Насладитесь красотой природой. Забронировать тур в Дагестан можно уже сейчас!"
            )
        )]),

        .recommendations([
            RecommendationsCellSource(imageUser: "crimea", nameUser: "crimea_082"),
            RecommendationsCellSource(imageUser: "woman", nameUser: "mary_pol"),
            RecommendationsCellSource(imageUser: "woman", nameUser: "mary_pol")
        ]),

        .post([
            PostCellSource(
                imageUser: "guyAndHorses",
                nameUser: "tur_v_dagestan",
                postImage: ["dagestanMountains", "dagestanMountains"],
                numberLikes: Constants.numberLikes,
                comment: CommentInfo(
                    nameUser: "tur_v_dagestan",
                    commentText: "Насладитесь красотой природой. Забронировать тур в Дагестан можно уже сейчас!"
                )
            )
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addSubview()
        setupBarButtonItem()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func addSubview() {
        view.backgroundColor = .white
        view.addSubview(rmLinkButton)
        view.addSubview(messagesIconButton)
        view.addSubview(tableView)
    }

    private func setupBarButtonItem() {
        let rmLogo = UIBarButtonItem(customView: rmLinkButton)
        let messagesIcon = UIBarButtonItem(customView: messagesIconButton)

        rmLogo.customView?.widthAnchor.constraint(equalToConstant: 70).isActive = true
        rmLogo.customView?.heightAnchor.constraint(equalToConstant: 26).isActive = true

        navigationItem.rightBarButtonItem = messagesIcon
        navigationItem.leftBarButtonItem = rmLogo
    }

    private func setupTableView() {
        tableView.register(FeedStoriesViewCell.self, forCellReuseIdentifier: FeedStoriesViewCell.reuseIdentifier)
        tableView.register(FeedPostsViewCell.self, forCellReuseIdentifier: FeedPostsViewCell.reuseIdentifier)
        tableView.register(
            FeedRecommendationsViewCell.self,
            forCellReuseIdentifier: FeedRecommendationsViewCell.reuseIdentifier
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 450
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    private func setupConstraints() {
        rmLinkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        rmLinkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true

        messagesIconButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        messagesIconButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

// MARK: - Extensions

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = rowsType[section]
        switch cell {
        case .stories, .post, .recommendations:
            return 1
        default:
            rowsType.count - 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rowsType[indexPath.section]

        switch row {
        case let .stories(story):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FeedStoriesViewCell.reuseIdentifier,
                for: indexPath
            ) as? FeedStoriesViewCell else { return UITableViewCell() }
            cell.configurationCellStories(data: story)
            return cell

        case let .post(post):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FeedPostsViewCell.reuseIdentifier,
                for: indexPath
            ) as? FeedPostsViewCell else { return UITableViewCell() }
            cell.configure(data: post)
            return cell

        case let .recommendations(recommendation):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FeedRecommendationsViewCell.reuseIdentifier,
                for: indexPath
            ) as? FeedRecommendationsViewCell else { return UITableViewCell() }
            cell.configure(data: recommendation)
            return cell
        }
    }
}

// MARK: - Extensions

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = rowsType[indexPath.section]
        switch cell {
        case .stories:
            return UITableView.automaticDimension
        case let .post(postCellSource):
            return UITableView.automaticDimension
        case .recommendations:
            return UITableView.automaticDimension
        }
    }
}
