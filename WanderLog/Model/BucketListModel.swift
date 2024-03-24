//
//  BucketList.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import Foundation

struct BucketListModel:  Identifiable, Hashable, Codable {
    let id: String
    var ownerUid: String
    var items: [Bucket]
    var itinerary: String?
    let createdAt: Date
    var updatedAt: Date?
    
//    mutating func addBucket(city: String, country: String) {
//        let newBucket = Bucket(id: UUID().uuidString, city: city, country: country, visited: false)
//            items.append(newBucket)
//    }
}

//extension BucketList {
//    static var MOCK_POSTS: [BucketList] = [
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, items: [Bucket.init(id: NSUUID().uuidString, city: "Delhi", country: "India", visited: true)], itinerary: "Must visit Malviya Nagar", createdAt: Date())
//    ]
//}
