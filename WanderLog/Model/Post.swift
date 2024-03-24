//
//  Post.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    var location: String?
    var updatedAt: Date?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test Caption", likes: 111, imageUrl: "pic1", timestamp: Timestamp(), user: User.MOCK_USERS[0], location: "Rajasthan, India"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "My Caption", likes: 14, imageUrl: "pic2", timestamp: Timestamp(), user: User.MOCK_USERS[1], location: "California, USA"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Yolo", likes: 1378, imageUrl: "pic3", timestamp: Timestamp(), user: User.MOCK_USERS[2], location: "Delhi, India"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Angel priya in the town", likes: 1, imageUrl: "dp", timestamp: Timestamp(), user: User.MOCK_USERS[3], location: "Connecticut, USA"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "#officesiyape", likes: 56, imageUrl: "pic1", timestamp: Timestamp(), user: User.MOCK_USERS[4], location: "Los Angeles, USA")
    ]
}
