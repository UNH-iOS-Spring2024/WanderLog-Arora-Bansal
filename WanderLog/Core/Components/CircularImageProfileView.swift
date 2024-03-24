//
//  CircularImageProfileView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/24/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
            case .xSmall:
                return 40
            case .small:
                return 48
            case .medium:
                return 64
            case .large:
                return 80
        }
    }
}

struct CircularImageProfileView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularImageProfileView(user: User.MOCK_USERS[0], size: .large)
}
