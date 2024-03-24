//
//  Bucket.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import Foundation

struct Bucket: Identifiable, Hashable, Codable {
    let id: String
    var city: String
    var country: String
    var visited: Bool
}
