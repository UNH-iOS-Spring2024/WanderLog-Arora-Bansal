//
//  FeedCell.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            if let user = post.user {
                CircularImageProfileView(user: user, size: .xSmall)
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    if post.location != nil {
                        Text(post.location ?? "")
                    }
                }
                .font(.footnote)
            }
            Spacer()
            
        }.padding(.leading, 8)
        
        KFImage(URL(string: post.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipShape(Rectangle())

        HStack(spacing: 16) {
            Button {
                print("like post")
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            
            Button {
                print("comment on post")
            } label: {
                Image(systemName: "bubble.right")
                    .imageScale(.large)
            }
        }
        .padding(.leading, 8)
        .padding(.top, 4)
        .foregroundColor(.black)
        
        Text("\(post.likes) Likes")
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
        
        //Caption Label
        HStack {
            Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
            Text(post.caption)
                
        }
        .font(.footnote)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(.leading, 10)
        .padding(.top, 1)
        
        //Timestamp
        Text("6h ago")
            .font(.footnote)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            .foregroundColor(.gray)
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[2])
}
