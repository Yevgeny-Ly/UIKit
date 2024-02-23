// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let heightCellHeader: CGFloat = 220
        static let heightCellStories: CGFloat = 110
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

    private var informationProfile = ProfileInfo(
        avatarName: "girl",
        userName: "Мария Иванова",
        bioPerson: "Консультант",
        postsNumber: 67,
        subscribersNumber: 458,
        subscriptionsNumber: 120
    )

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

    func presentModalWebView(url: URL) {
        let viewController = UIViewController()

        let webView = WKWebView(frame: UIScreen.main.bounds)
        let request = URLRequest(url: url)
        webView.load(request)

        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(named: "closeButtonX"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeModalWebView), for: .touchUpInside)

        viewController.view = webView
        viewController.view.addSubview(closeButton)

        closeButton.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 90).isActive = true
        closeButton.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 10).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen

        present(navigationController, animated: true, completion: nil)
    }

    @objc func closeModalWebView() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Подписываюсь на Data Source для таблицы

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rowsType[indexPath.section] {
        case .header:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: ProfileHeaderViewCell.identifier,
                    for: indexPath
                ) as? ProfileHeaderViewCell
            else { return UITableViewCell() }

            cell.configure(
                link: "https://www.spacex.com",
                informationProfile,
                presentWebViewClosure: { [weak self] url in
                    self?.presentModalWebView(url: url)
                }
            )
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
