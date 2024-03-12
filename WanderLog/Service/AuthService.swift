//
//  AuthService.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/11/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, fullname: String , username: String, password: String, bucketList: BucketList) async throws {
        print("Email: \(email)")
        print("FullName: \(fullname)")
        print("UserName: \(username)")
        print("Password: \(password)")
        print("BucketList: \(bucketList)")
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() async throws {
        
    }
}

