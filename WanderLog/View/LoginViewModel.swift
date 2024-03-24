//
//  LoginViewModel.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/23/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
