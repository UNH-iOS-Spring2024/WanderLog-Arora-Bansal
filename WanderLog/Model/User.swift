//
//  User.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var bucketList: BucketListModel?
    var createdAt: Date
    var updatedAt: Date?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "a388@gmail.com", username: "a388", profileImageUrl: nil, fullname: "Sam K", bio: "Dark Knight", createdAt: Date()),
        .init(id: NSUUID().uuidString, email: "adi@gmail.com", username: "adi28", profileImageUrl: nil, fullname: "Adi M", bio: "Let me live!", createdAt: Date()),
        .init(id: NSUUID().uuidString, email: "tanu@gmail.com", username: "papakipari", profileImageUrl: nil, fullname: "Fruity Pakoda", bio: "Haq se Single", createdAt: Date()),
        .init(id: NSUUID().uuidString, email: "naina@gmail.com", username: "lol", profileImageUrl: nil, fullname: "Naina Kapoor", bio: "Somewhere beyond the world", createdAt: Date()),
        .init(id: NSUUID().uuidString, email: "tushar@gmail.com", username: "dukhiatma", profileImageUrl: nil, fullname: "Tushar K", bio: "Crying!!", createdAt: Date())
    ]
}

