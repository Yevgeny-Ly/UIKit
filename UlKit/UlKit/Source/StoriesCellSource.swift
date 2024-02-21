// StoriesCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для историй
struct StoriesCellSource {
    // MARK: - Public Methods

    let image: UIImage?
    let nameUser: String
    let isAddStoriesButton: Bool
    let isNewStory: Bool
}

typealias StoriesSourceTypealias = [StoriesCellSource]
