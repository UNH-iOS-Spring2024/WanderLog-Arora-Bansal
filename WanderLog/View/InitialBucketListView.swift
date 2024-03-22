//
//  InitialBucketListView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/21/24.
//

import SwiftUI

struct InitialBucketListView: View {
    @State private var country = ""
    @State private var city = ""
    
    var body: some View {
        LogoView()
        
        Text("Create a Bucket List to begin")
            .font(.title)
            .padding()
        
        Text("Bucket List Item 1: ")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
        TextField("Country", text: $country)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        
        TextField("City", text: $city)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        
        Button {
            print("Sign Up button pressed")
        } label: {
            Text("Sign Up")
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(.white)
        .frame(width: 360, height: 44)
        .background(Color(.systemBlue))
        .cornerRadius(10)
        
    }
}

#Preview {
    InitialBucketListView()
}
