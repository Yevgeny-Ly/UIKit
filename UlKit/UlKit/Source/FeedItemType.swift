// FeedItemType.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисления с вариантами постов
enum FeedItemType {
    // MARK: - Public Methods

    case stories(StoriesSourceTypealias)
    case post(PostsSourceTypealias)
    case recommendations(RecommendationsCellTypealias)
}
