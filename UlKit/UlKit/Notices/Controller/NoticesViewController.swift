// NoticesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран табличного представвления уведомлений
class NoticesViewController: UIViewController {
    // MARK: - Constants
 
    enum Constants {
        static var fontVerdana = "Verdana"
        static var fontVerdanaBold = "Verdana-Bold"
        static var titleNotices = "Уведомления"
        static var lableSubscriptionRequests = "Запросы на подписку"
    }

    // MARK: - Visual Components

    private let inquiriesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.lableSubscriptionRequests
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private Properties

    private let tableView = UITableView(frame: .zero, style: .plain)

    private let noticesCellSource: [CellTypeNotification] = [
        .picture([
            PictureCellSource(avatar: .girlAndLavender, comment: CommentInformation(
                nameUser: "lavanda123",
                commentText: "понравлся ваш комментарий: «Очень красиво»"
            ), image: .galitsynTrail),
            PictureCellSource(
                avatar: .girlAndLavender,
                comment: CommentInformation(
                    nameUser: "lavanda123",
                    commentText: "упомянул(-а) вас в комметарии: @rm Спасибо"
                ),
                image: .galitsynTrail
            )
        ]),

        .button([
            ButtonCellSource(
                avatar: .guy,
                comment: CommentInformation(
                    nameUser: "12miho",
                    commentText: "появился(-ась) в RMLink. Вы можете быть знакомы"
                ), buttonTitle: "Подписаться"
            )
        ])
    ]

    private let sectionHeader = ["Сегодня", "На этой неделе"]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupTableView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        tableView.register(
            NotificationsPictureViewCell.self,
            forCellReuseIdentifier: NotificationsPictureViewCell.reuseIdentifier
        )
        tableView.register(
            NotificationsButtonViewCell.self,
            forCellReuseIdentifier: NotificationsButtonViewCell.reuseIdentifier
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    private func addSubview() {
        view.backgroundColor = .white
        navigationItem.title = Constants.titleNotices
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(inquiriesLabel)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        inquiriesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        inquiriesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension NoticesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        noticesCellSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch noticesCellSource[section] {
        case let .picture(sources):
            return sources.count
        case let .button(sources):
            return sources.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notice = noticesCellSource[indexPath.section]

        switch notice {
        case let .picture(sources):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationsPictureViewCell.reuseIdentifier,
                for: indexPath
            ) as? NotificationsPictureViewCell else { return UITableViewCell() }
            let source = sources[indexPath.row]
            cell.configurationCell(data: source)
            return cell

        case let .button(sources):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationsButtonViewCell.reuseIdentifier,
                for: indexPath
            ) as? NotificationsButtonViewCell else { return UITableViewCell() }
            let source = sources[indexPath.row]
            cell.configurationCell(data: source)
            return cell
        }
    }
}

extension NoticesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionHeader[section]
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white

        let headerLabel = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.size.width - 30, height: 20))
        headerLabel.font = UIFont(name: Constants.fontVerdanaBold, size: 12)
        headerLabel.textColor = .black
        headerLabel.text = sectionHeader[section]

        headerView.addSubview(headerLabel)

        return headerView
    }
}
