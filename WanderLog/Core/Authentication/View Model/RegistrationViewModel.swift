//
//  RegistrationViewModel.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/23/24.
//

import Foundation

class RegistrationViewModel: ObservableObject{
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var fullname =  ""
    @Published var bucketList = BucketListModel(id: UUID().uuidString, ownerUid: UUID().uuidString, items: [], createdAt: Date())
    
    @MainActor
    func createUser() async throws {
        do {
            try await AuthService.shared.createUser(email: email, fullname: fullname, username: username, password: password, bucketList: bucketList)
            username = ""
            email = ""
            password = ""
            fullname = ""
            bucketList.items = []
        } catch {
            print("Error in Register \(error.localizedDescription)")
        }
    }
}

