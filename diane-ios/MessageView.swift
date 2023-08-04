//
//  MessageView.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-21.
//

import SwiftUI

struct MessageView : View {
    var message: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if !message.user.isCurrentUser {
                Circle()
                    .fill(.blue)
                    .frame(width: 40, height: 40, alignment: .center)
            } else {
                Spacer()
            }
            
            ContentMessageView(contentMessage: message.content,
                               isCurrentUser: message.user.isCurrentUser)
            
            if !message.user.isCurrentUser {
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(content: "There are a lot of premium iOS templates on iosapptemplates.com", user: User(name: "John", avatar: "null")))
        MessageView(message: Message(content: "There are a lot of premium iOS templates on iosapptemplates.com", user: User(name: "John", avatar: "null", isCurrentUser: true)))
    }
}
