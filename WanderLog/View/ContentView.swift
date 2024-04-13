//
//  ContentView.swift
//  WanderLog
//
//  Created by Tarasha Bansal on 2/21/24.
//

import SwiftUI
import FirebaseFirestore
struct ContentView: View {
    @State private var userID = UserDefaults.standard.string(forKey: "UserID")
    var body: some View {
        NavigationStack{
            if userID == nil{
                LoginView()
            }
            else{
                NavBarUI(tabViewSelection: 0)
            }
        }
        .preferredColorScheme(.dark)
    }
}
#Preview {
    ContentView()
}
