//
//  iOSView.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import SwiftUI

struct iOSView: View {
    
    @State var posts: [Post] = []
    @State var skipNumber: Int = 0
    var itemCount: Int = 12
    
    var body: some View {
        VStack {
            Text("Short Writings")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(posts) { post in
                        SinglePostView(post: post)
                    }
                    
                    Button(action:{
                        skipNumber += itemCount
                        getPosts(apiUrlString: "https://dummyjson.com/posts?sortBy=id&order=desc&limit=\(itemCount)&skip=\(skipNumber)") { posts in
                            if let posts = posts {
                                self.posts += posts
                            }
                        }
                    }) {
                        Text("Load More")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.title2)
                            .foregroundColor(.lightBlue)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(.lightBlue)
                            )
                    }
                }
                .padding()
                .onAppear {
                    getPosts(apiUrlString: "https://dummyjson.com/posts?sortBy=id&order=desc&limit=\(itemCount)&skip=\(skipNumber)") { posts in
                        if let posts = posts {
                            self.posts += posts
                        }
                    }
            }
            }
        }
    }
}

#Preview {
    iOSView()
}
