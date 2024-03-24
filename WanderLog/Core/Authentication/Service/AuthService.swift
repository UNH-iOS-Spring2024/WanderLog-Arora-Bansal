//
//  AutjService.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to login in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, fullname: String , username: String, password: String, bucketList: BucketListModel) async throws {
        print("Email: \(email)")
        print("FullName: \(fullname)")
        print("UserName: \(username)")
        print("Password: \(password)")
        print("BucketList: \(bucketList)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            var mutableBucketList = bucketList  
            mutableBucketList.ownerUid = result.user.uid
            await uploadUserData(uId: result.user.uid, email: email, username: username,  fullname: fullname, bucketList: mutableBucketList)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uId: String, email: String, username: String,  fullname: String, bucketList: BucketListModel ) async {
        let user = User(id: uId, email: email, username: username, fullname: fullname, bucketList: bucketList, createdAt: Date())
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
