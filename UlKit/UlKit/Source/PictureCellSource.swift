// PictureCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для ячейки с картинкой
struct PictureCellSource {
    /// Аватарка пользователя
    let avatarImage: String
    /// Комментарий пользователя
    let comment: CommentInformation?
    /// Картинка поста
    let imagePost: String

    /// Источник данных для подраздела комментарии
    struct CommentInformation {
        /// Имя пользователя в комментариях
        let nameUser: String
        /// Комментарий пользователя
        let commentText: String
    }
}

typealias PictureCellTypealias = [PictureCellSource]
