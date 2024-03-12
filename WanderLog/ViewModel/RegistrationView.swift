//
//  RegistrationView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/11/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var bucketList = BucketList(id: UUID().uuidString, ownerUid: UUID().uuidString, items: [], user: nil, itinerary: nil, updatedAt: nil)
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, fullname: fullname, username: username, password: password, bucketList: BucketList(id: UUID().uuidString, ownerUid: UUID().uuidString, items: []))
    }
}
