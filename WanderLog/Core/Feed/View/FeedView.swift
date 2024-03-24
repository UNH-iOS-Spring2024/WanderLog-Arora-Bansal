//
//  FeedView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 32){
                    ForEach(viewModel.posts){
                        post in FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    LogoView()
                        .frame(width: 85, height: 85)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
