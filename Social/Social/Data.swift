//
// Data.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import Foundation

struct Story: Codable, Hashable {
    var id = UUID()
    let title: String
}

struct Post: Codable, Hashable {
    var id = UUID()
    let title: String
}

enum FeedItem: Identifiable, Hashable {
    case story(Story)
    case post(Post)
    
    var id: UUID {
        switch self {
        case .story(let story):
            return story.id
        case .post(let post):
            return post.id
        }
    }
    
    static func == (lhs: FeedItem, rhs: FeedItem) -> Bool {
        return lhs.id == rhs.id
    }
}

let stories = [FeedItem.story(Story(title: "Apple")),
               FeedItem.story(Story(title: "Orange")),
               FeedItem.story(Story(title: "Strawberry"))]

let posts = [FeedItem.post(Post(title: "Apple")),
               FeedItem.post(Post(title: "Orange")),
               FeedItem.post(Post(title: "Strawberry"))]
