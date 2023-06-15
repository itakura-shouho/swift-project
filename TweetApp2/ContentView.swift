//
//  ContentView.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    @State private var showPostView = false
    
    var body: some View {
        VStack(spacing: 0) {
            UserView(image: Image("スライム"), userName: "悪いスライムじゃないよ")
            VStack{
              
                PostListView()
                Button(action: {
                    showPostView = true
                }) {
                    Image(systemName:"square.and.pencil")
                        .font(.system(size:40))
                }
                
                
                .padding()
                .sheet(isPresented: $showPostView) {
                    PostView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

