//
// Data.swift
// Social
//
// Created by Brett Markowitz on 1/9/22.
//

import Foundation

class Data: ObservableObject {
    var currentUser = defaultUser
    
    var feedStories: [FeedItem] = []
    var feedPosts: [FeedItem] = []
    var activities: [Activity] = []
    
    init() {
        let shuffledPosts = posts.shuffled()
        feedPosts = shuffledPosts.map { FeedItem.post($0) }
        
        feedStories.append(FeedItem.story(Story(user: currentUser)))
        shuffledPosts.filter { $0.user.id != currentUser.id }
                    .forEach { feedStories.append(FeedItem.story(Story(user: $0.user))) }
        
        self.activities = defaultActivites
    }
    
    func getPostsByUserID(_ userID: UUID) -> [FeedItem] {
        return posts.filter { $0.user.id == userID }.map { FeedItem.post($0) }
    }
}

let data = Data()

struct User: Hashable {
    var id = UUID()
    var name: String
    var username: String
    var bio: String?
    var avatarURL: String?
    var website: String?
    var email: String?
    
    init(name: String, username: String, bio: String?, avatarURL: String?, website: String?, email: String?) {
        self.name = name
        self.username = username
        self.bio = bio
        self.avatarURL = avatarURL
        self.website = website
        self.email = email
    }
}

struct Story: Hashable {
    var id = UUID()
    var user: User
}

struct Post: Hashable {
    var id = UUID()
    var content: String
    var imageURL: String?
    var user: User
    var createdAt = Date().addingTimeInterval(-5000)
    var likes = Int.random(in: 1..<10)
    var replies: [Post]
    
    init(content: String, imageURL: String?, user: User, replies: [Post]) {
        self.content = content
        self.imageURL = imageURL
        self.user = user
        self.replies = replies
    }
    
    func formattedDate() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: self.createdAt, relativeTo: Date()).replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "ago", with: "")
    }
}

enum ActivityType {
    case followed
    case liked
}

struct Activity: Identifiable, Hashable {
    var id = UUID()
    var type: ActivityType
    var user: User
    var post: Post?
    var createdAt = Date()
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

enum ProfileItem: Identifiable, Hashable {
    case info(User)
    case post(Post)
    
    var id: UUID {
        switch self {
        case .info(let user):
            return user.id
        case .post(let post):
            return post.id
        }
    }
    
    static func == (lhs: ProfileItem, rhs: ProfileItem) -> Bool {
        return lhs.id == rhs.id
    }
}

enum PostDetailItem: Identifiable, Hashable {
    case post(Post)
    case reply(Post)
    
    var id: UUID {
        switch self {
        case .post(let post):
            return post.id
        case .reply(let reply):
            return reply.id
        }
    }
    
    static func == (lhs: PostDetailItem, rhs: PostDetailItem) -> Bool {
        return lhs.id == rhs.id
    }
}

let defaultUser = User(name: "Ezra Ware",
                       username: "eware",
                       bio: "Food aficionado. Friend of animals everywhere. Communicator. Social media fanatic.",
                       avatarURL: "https://media.istockphoto.com/photos/positivity-puts-you-in-a-position-of-power-picture-id1299077582?b=1&k=20&m=1299077582&s=170667a&w=0&h=Esjqlg_WCWmTc83Dv6PLhwPFwYN9uXoclBn0cUhtS5I=",
                       website: "https://website.com",
                       email: "ezra@ware.com")
let user1 = User(name: "Aliya Coles",
                 username: "acoles",
                 bio: "Entrepreneur. Student. Proud travel lover. Food fanatic. Communicator. Creator. Thinker. Analyst",
                 avatarURL: "https://media.istockphoto.com/photos/smiling-young-woman-beauty-close-up-portrait-picture-id1280113805?b=1&k=20&m=1280113805&s=170667a&w=0&h=wjd1qvAxZkavd83z0OIKK_rUnXPJy-L2z8V2HdBDkp0=",
                 website: nil,
                 email: nil)
let user2 = User(name: "Edward Winter",
                 username: "edwinter",
                 bio: "Amateur music advocate. Food buff. Bacon specialist. Problem solver.",
                 avatarURL: "https://media.istockphoto.com/photos/m-happy-with-where-my-career-is-heading-picture-id1138617116?b=1&k=20&m=1138617116&s=170667a&w=0&h=qyoCgp5gG34Kj--3WeZVRiCe2ofD6Da9JeMS12gUh8w=",
                 website: nil,
                 email: nil)
let user3 = User(name: "Jayce Beattie",
                 username: "jbeattie",
                 bio: nil,
                 avatarURL: nil,
                 website: nil,
                 email: nil)
let user4 = User(name: "Alexis McGill",
                 username: "emcgill",
                 bio: "Travel fanatic. Web guru. Zombie advocate. Tv evangelist. Friendly food expert.",
                 avatarURL: "https://media.istockphoto.com/photos/businesswomans-portrait-picture-id1279504799?b=1&k=20&m=1279504799&s=170667a&w=0&h=Q-qDfKI3nIvLYaFRHL5cBb2m2kwU_q76mqILgEoT_m8=",
                 website: nil,
                 email: nil)
let user5 = User(name: "Allen Doyle",
                 username: "adoyle",
                 bio: "Amateur coffee guru. Travel fanatic. Zombie ninja. Evil thinker. Music junkie. Gamer. Webaholic. Problem solver.",
                 avatarURL: "https://media.istockphoto.com/photos/africanamerican-businessman-picture-id1300952714?b=1&k=20&m=1300952714&s=170667a&w=0&h=uR9oQqIV5h_yot4i8iL4avnkYvagLtHexdc0YuZ3tO4=",
                 website: nil,
                 email: nil)

let stories = [FeedItem.story(Story(user: defaultUser)),
               FeedItem.story(Story(user: user1)),
               FeedItem.story(Story(user: user2)),
               FeedItem.story(Story(user: user3)),
               FeedItem.story(Story(user: user4)),
               FeedItem.story(Story(user: user5))]

let posts = [
    Post(content: "tonight's dinner 😋", imageURL: "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=960&q=80", user: defaultUser, replies: [
        Post(content: "Yum", imageURL: nil, user: user1, replies: [])
    ]),
    Post(content: "Central Park", imageURL: "https://images.unsplash.com/photo-1603471759569-2bfc3a180309?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=960&q=80", user: user1, replies: []),
    Post(content: "who's coming to the party tonight?", imageURL: nil, user: user2, replies: [
        Post(content: "me!", imageURL: nil, user: defaultUser, replies: []),
        Post(content: "See you there.", imageURL: nil, user: user5, replies: [])
    ]),
    Post(content: "just setting up my feedr", imageURL: nil, user: user3, replies: []),
    Post(content: "We're hiring customer support specialists. Let me know if anyone comes to mind!", imageURL: nil, user: user4, replies: [
        Post(content: "I'll DM you.", imageURL: nil, user: defaultUser, replies: [])
    ]),
    Post(content: "And we're off ✈️", imageURL: "https://images.unsplash.com/photo-1575427862440-9afbff3e64ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=960&q=80", user: user5, replies: [
        Post(content: "have fun!", imageURL: nil, user: user4, replies: [])
    ]),
    Post(content: "who has recommendations for a dentist near the park?", imageURL: nil, user: defaultUser, replies: [])
]

let defaultActivites = [
    Activity(type: .liked, user: user1),
    Activity(type: .followed, user: user2),
    Activity(type: .liked, user: user2),
    Activity(type: .followed, user: user3),
    Activity(type: .followed, user: user4),
    Activity(type: .followed, user: user5),
    Activity(type: .liked, user: user3),
    Activity(type: .followed, user: user1),
    Activity(type: .liked, user: user4),
    Activity(type: .liked, user: user5),
]
