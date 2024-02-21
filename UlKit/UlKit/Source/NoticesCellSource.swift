// NoticesCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисления ячеек
enum CellTypeNotification {
    // MARK: - Public Methods

    case picture(PictureCellTypealias)
    case button(ButtonCellTypealias)
}

/// Источник данных для ячейки с картинкой
struct PictureCellSource {
    // MARK: - Public Methods

    let avatar: UIImage
    let comment: CommentInformation?
    let image: UIImage
}

typealias PictureCellTypealias = [PictureCellSource]

/// Источник данных для ячейки с кнопкой
struct ButtonCellSource {
    // MARK: - Public Methods

    let avatar: UIImage
    let comment: CommentInformation?
    let buttonTitle: String
}

typealias ButtonCellTypealias = [ButtonCellSource]

struct CommentInformation {
    // MARK: - Public Methods

    let nameUser: String
    let commentText: String
}
