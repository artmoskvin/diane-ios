//
//  ChatModel.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-21.
//

import Foundation

struct Message: Hashable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.content == rhs.content && lhs.user == rhs.user
    }
    
    var content: String
    var user: User
}

struct User: Hashable {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}

struct DataSource {
    static let firstUser = User(name: "Maria Shadapova", avatar: "lady")
    static var secondUser = User(name: "Duy Bui", avatar: "myAvatar", isCurrentUser: true)
    static let messages = [
        Message(content: "Hi, I really love your templates and I would like to buy the chat template", user: DataSource.firstUser),
        Message(content: "Thanks, nice to hear that, can I have your email please?", user: DataSource.secondUser),
        Message(content: "😇", user: DataSource.firstUser),
        Message(content: "Oh actually, I have just purchased the chat template, so please check your email, you might see my order", user: DataSource.firstUser),
        Message(content: "Great, wait me a sec, let me check", user: DataSource.secondUser),
        Message(content: "Sure", user: DataSource.firstUser)
    ]
}
