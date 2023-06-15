//
//  PostListView.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import SwiftUI
import CoreData

struct PostListView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var tweets: FetchedResults<TweetEntity>
    
    var body: some View {
        List {
            ForEach(tweets) { tweet in
                if tweet.textBody?.isEmpty == false {
                    HStack {
                        Text(tweet.textBody!)
                        Spacer()
                        Button(action: {
                            deleteTweet(tweet)
                        }) {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
        }
    }
    
    private func deleteTweet(_ tweet: TweetEntity) {
        viewContext.delete(tweet)
        try? viewContext.save()
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
