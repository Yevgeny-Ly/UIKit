// PostCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для постов
struct PostCellSource {
    // MARK: - Public Methods

    let imageUser: UIImage?
    let nameUser: String
    let image: [UIImage]
    let numberLikes: Int
    let comment: CommentInfo?
}

struct CommentInfo {
    // MARK: - Public Methods

    let nameUser: String
    let commentText: String
}

typealias PostsSourceTypealias = [PostCellSource]
