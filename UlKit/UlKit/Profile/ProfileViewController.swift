// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let heightCellHeader: CGFloat = 220
        static let heightCellStories: CGFloat = 80
        static let heightCellFeed: CGFloat = 375
    }

    // MARK: - Private Properties

    private var webView: WKWebView?
    private let tableView = UITableView(frame: .zero, style: .plain)

    /// mock значения
    private var rowsType: [ProfileItemType] = [
        .header,
        .stories([
            PostStoriesCellSource(avatarImage: "start", nameUser: "Запуск"),
            PostStoriesCellSource(avatarImage: "moon", nameUser: "Луна"),
            PostStoriesCellSource(
                avatarImage: "astronaut",
                nameUser: "Космонавт"
            ),
            PostStoriesCellSource(avatarImage: "start", nameUser: "Запуск"),
            PostStoriesCellSource(avatarImage: "moon", nameUser: "Луна"),
            PostStoriesCellSource(
                avatarImage: "astronaut",
                nameUser: "Космонавт"
            )
        ]),
        .feed([
            ProfileFeedCellSource(postImage: "stratosphere"),
            ProfileFeedCellSource(postImage: "rocket"),
            ProfileFeedCellSource(postImage: "earth"),
            ProfileFeedCellSource(postImage: "oldFashionedPlatform"),
            ProfileFeedCellSource(postImage: "earth"),
            ProfileFeedCellSource(postImage: "stratosphere"),
            ProfileFeedCellSource(postImage: "stratosphere"),
            ProfileFeedCellSource(postImage: "rocket"),
            ProfileFeedCellSource(postImage: "earth")
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        setupTableView()
        addSubview()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupBarButtonItem() {
        let lockLogo = UIBarButtonItem(image: .lock, style: .plain, target: self, action: #selector(method))
        let userNameLogo = UIBarButtonItem(image: .maryRmLink, style: .plain, target: self, action: #selector(method))
        navigationItem.leftBarButtonItems = [lockLogo, userNameLogo]

        let addLogo = UIBarButtonItem(image: .addIcon, style: .plain, target: self, action: #selector(method))
        let directLogo = UIBarButtonItem(image: .moreIcon, style: .plain, target: self, action: #selector(method))
        navigationItem.rightBarButtonItems = [addLogo, directLogo]

        [lockLogo, userNameLogo, addLogo, directLogo].forEach { $0.tintColor = .black }
    }

    private func setupTableView() {
        tableView.register(ProfileHeaderViewCell.self, forCellReuseIdentifier: ProfileHeaderViewCell.identifier)
        tableView.register(ProfileStoriesViewCell.self, forCellReuseIdentifier: ProfileStoriesViewCell.reuseIdentifier)
        tableView.register(ProfileFeedViewCell.self, forCellReuseIdentifier: ProfileFeedViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.reloadData()
    }

    private func addSubview() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - Подписываюсь на Data Source для таблицы

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = rowsType[section]
        switch cell {
        case .header, .feed, .stories:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rowsType[indexPath.section]
        switch row {
        case .header:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: ProfileHeaderViewCell.identifier,
                    for: indexPath
                ) as? ProfileHeaderViewCell
            else { return UITableViewCell() }

            cell.configure {
                let webView = WKWebView(frame: UIScreen.main.bounds)
                let url = URL(string: "https://www.spacex.com")!
                let request = URLRequest(url: url)
                webView.load(request)

                let viewController = UIViewController()
                viewController.view = webView

                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.modalPresentationStyle = .fullScreen

                self.present(navigationController, animated: true, completion: nil)
            }
            return cell

        case let .stories(stories):
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: ProfileStoriesViewCell.reuseIdentifier,
                    for: indexPath
                ) as? ProfileStoriesViewCell
            else { return UITableViewCell() }
            cell.configure(with: stories)
            return cell

        case let .feed(feed):
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: ProfileFeedViewCell.identifier,
                    for: indexPath
                ) as? ProfileFeedViewCell
            else { return UITableViewCell() }
            cell.configure(with: feed)
            return cell
        }
    }
}

// MARK: - Подписываюсь на Delegate для таблицы

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = rowsType[indexPath.section]
        switch cell {
        case .header:
            return Constants.heightCellHeader
        case .stories:
            return Constants.heightCellStories
        case .feed:
            return Constants.heightCellFeed
        }
    }
}
