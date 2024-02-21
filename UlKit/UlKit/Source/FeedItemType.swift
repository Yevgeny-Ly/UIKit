// FeedItemType.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кейсы с вариантами постов контента
enum FeedItemType {
    // MARK: - Public Methods

    case stories(StoriesSourceTypealias)
    case post(PostsSourceTypealias)
    case recommendations(RecommendationsCellTypealias)
}
