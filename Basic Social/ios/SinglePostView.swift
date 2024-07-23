//
//  SinglePostVew.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import SwiftUI

struct SinglePostView: View {
    let post: Post
    
    var body: some View {
        Group {
            VStack(spacing: 20) {
                Text(post.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .textScale(.default)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(post.body)
                    .font(.subheadline)
                
                HStack {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                        Text("\(post.reactions.likes)")
                    }
                    
                    HStack {
                        Image(systemName: "hand.thumbsdown")
                        Text("\(post.reactions.dislikes)")
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
        }
        .background(.lightBlue)
        .cornerRadius(5)
    }
}

#Preview {
    SinglePostView(post: samplePost)
}
