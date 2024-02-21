// NoticesCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Варианты ячеек
enum CellTypeNotification {
    // MARK: - Public Methods

    case picture(PictureCellTypealias)
    case button(ButtonCellTypealias)
}

/// Модель ячейки с картинкой
struct PictureCellSource {
    // MARK: - Public Methods

    let avatar: UIImage
    let comment: CommentInformation?
    let image: UIImage
}

typealias PictureCellTypealias = [PictureCellSource]

/// Модель ячейки с кнопкой
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
