//
//  UserView.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import SwiftUI

struct UserView: View {
    let image: Image
    let userName : String
    
    
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("こんにちは")
                    .foregroundColor(Color.tTitle)
                    .font(.footnote)
                Text("\(userName)")
                    .foregroundColor(Color.tTitle)
                    .font(.title)
            }
            Spacer()
                    Image("スライム")
                    .resizable()
                    .frame(width:60,height:60)

            
        }
        .padding()
        .background(Color.tBackground)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            UserView(image: Image("スライム"),
                    userName: "User Name")
        }
    }
}
