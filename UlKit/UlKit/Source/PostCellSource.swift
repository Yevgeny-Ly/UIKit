// PostCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для постов
struct PostCellSource {
    /// Аватарка пользователя
    let imageUser: String
    /// Имя пользователя
    let nameUser: String
    /// Картинка для поста
    let postImage: [String]
    /// Количество лайков
    let numberLikes: Int
    /// Комментарий пользователя
    let comment: CommentInfo?

    /// Источник данных для подраздела комментарии
    struct CommentInfo {
        /// Имя пользователя в комментариях
        let nameUser: String
        /// Комментарий пользователя
        let commentText: String
    }
}

typealias PostsSourceTypealias = [PostCellSource]
