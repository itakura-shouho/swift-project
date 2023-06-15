//
//  PostView.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import SwiftUI
import CoreData

struct PostView: View {
    @State var textBody: String = ""
    @State var nowDate = Date()
    @State var dateText = ""
//    private let dateFormatter = DateFormatter()
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    
    fileprivate func save() {
        do {
            try  self.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
//    init() {
////        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
//        dateFormatter.dateFormat = "YYYY/MM/dd HHHH:mm:ss"
//
//        dateFormatter.locale = Locale(identifier: "ja_jp")
//        }

//    var timestamp : Date {
//            return Date()
//        }
//    var timestamp : nowDate
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("内容")) {
                    TextField("いまなにしてる？", text: $textBody)
                }
            }.navigationBarTitle("ツイート投稿")
                .navigationBarItems(trailing: Button(action: {
                    TweetEntity.create(in:self.viewContext,
                                       textBody: self.textBody,
                                       timestamp: self.nowDate
                                       
                    )
                    self.save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("送信")
                })
        }.background(Color(.systemBackground))
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        
        PostView()
    }
}
