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
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TweetEntity.timestamp, ascending: true)])
    var tweets: FetchedResults<TweetEntity>
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
        formatter.dateFormat = "yyyy/M/dd HH:mm"
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter
    }()
    
    var body: some View {
        List {
            ForEach(tweets) { tweet in
                if tweet.textBody?.isEmpty == false {
                    VStack{
                        Text("\(tweet.timestamp!, formatter: dateFormatter)")
                            .font(.caption)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        
                        HStack {
                            Text(tweet.textBody!)
                                .padding(.leading,10)
                                .padding(.vertical,1)
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
