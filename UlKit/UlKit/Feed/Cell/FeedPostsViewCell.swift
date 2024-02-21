// FeedPostsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки постов
final class FeedPostsViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static var fontVerdana = "Verdana"
        static var fontVerdanaBold = "Verdana-Bold"
        static var lableCommentary = "Комментировать..."
        static var labelTimerPost = "10 минут назад"
        static var labelLike = "Нравится: "
    }

    // MARK: - Visual Components

    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.shareIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.heartIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.commentIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.sendIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(.bookmarkIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .girl
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commenTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.lableCommentary
        label.textColor = .systemGray3
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timePostLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelTimerPost
        label.textColor = .systemGray3
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        return pageControl
    }()

    // MARK: - Public Properties

    static let reuseIdentifier = NSStringFromClass(FeedPostsViewCell.self)

    // MARK: - Private Properties

    private var loadedImages: [UIImage] = []
    private var postData: [PostCellSource] = []

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

    func configure(data: [PostCellSource]) {
        postData = data
        for (index, item) in data.enumerated() {
            pageControl.tag = index
            userImage.image = UIImage(named: item.imageUser)
            nickNameLabel.text = item.nameUser

            let postImages = item.postImage
            if !postImages.isEmpty {
                if let firstImageName = postImages.first, let firstImage = UIImage(named: firstImageName) {
                    postImage.image = firstImage
                }

                if postImages.count > 1 {
                    pageControl.numberOfPages = postImages.count
                    pageControl.currentPage = 0
                    pageControl.isHidden = false
                    pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
                } else {
                    pageControl.isHidden = true
                }
            } else {
                pageControl.isHidden = true
            }

            likesLabel.text = "\(Constants.labelLike)configurationCellPosts \(item.numberLikes)"

            if let comment = item.comment {
                customizesLabel(with: comment)
            }
        }
    }

    // MARK: - Private Methods

    private func addView() {
        contentView.addSubview(userImage)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(shareButton)
        contentView.addSubview(postImage)
        contentView.addSubview(heartButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        contentView.addSubview(bookmarkButton)
        contentView.addSubview(likesLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(commenTextLabel)
        contentView.addSubview(timePostLabel)
        contentView.addSubview(pageControl)
    }

    private func customizesLabel(with comment: CommentInfo) {
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

    private func setupConstraints() {
        setupNickNameLabelConstraints()
        setupShareButtonConstraints()
        setupPostImageConstraints()
        setupPageControlConstraints()
        setupHeartButtonConstraints()
        setupCommentButtonConstraints()
        setupSendButtonConstraints()
        setupBookmarkButtonConstraints()
        setupLikesLabelConstraints()
        setupCommentLabelConstraints()
        setupMyImageViewConstraints()
        setupCommenTextLabelConstraints()
        setupUserImageConstraints()
        setupTimePostLabelConstraints()
    }

    private func setupNickNameLabelConstraints() {
        nickNameLabel.centerYAnchor.constraint(equalTo: userImage.centerYAnchor).isActive = true
        nickNameLabel.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10).isActive = true
    }

    private func setupShareButtonConstraints() {
        shareButton.centerYAnchor.constraint(equalTo: nickNameLabel.centerYAnchor).isActive = true
        shareButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }

    private func setupPostImageConstraints() {
        postImage.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 20).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 239).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }

    private func setupPageControlConstraints() {
        pageControl.centerXAnchor.constraint(equalTo: postImage.centerXAnchor).isActive = true
        pageControl.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor).isActive = true
    }

    private func setupHeartButtonConstraints() {
        heartButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        heartButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    }

    private func setupCommentButtonConstraints() {
        commentButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        commentButton.leftAnchor.constraint(equalTo: heartButton.rightAnchor, constant: 12).isActive = true
    }

    private func setupSendButtonConstraints() {
        sendButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        sendButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 12).isActive = true
    }

    private func setupBookmarkButtonConstraints() {
        bookmarkButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        bookmarkButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }

    private func setupLikesLabelConstraints() {
        likesLabel.topAnchor.constraint(equalTo: bookmarkButton.bottomAnchor, constant: 10).isActive = true
        likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        likesLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupCommentLabelConstraints() {
        commentLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 10).isActive = true
        commentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        commentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
    }

    private func setupMyImageViewConstraints() {
        myImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 15).isActive = true
        myImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupCommenTextLabelConstraints() {
        commenTextLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor).isActive = true
        commenTextLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 5).isActive = true
    }

    private func setupUserImageConstraints() {
        userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        userImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupTimePostLabelConstraints() {
        timePostLabel.topAnchor.constraint(equalTo: commenTextLabel.bottomAnchor, constant: 10).isActive = true
        timePostLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        timePostLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        timePostLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    @objc
    private func pageControlValueChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        if sender.tag < postData.count {
            let item = postData[sender.tag]
            if loadedImages.isEmpty {
                loadedImages = item.postImage.map { UIImage(contentsOfFile: $0) ?? UIImage() }
            }

            if currentPage < loadedImages.count {
                postImage.image = loadedImages[currentPage]
            }
        }
    }
}
