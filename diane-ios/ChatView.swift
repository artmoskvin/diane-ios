//
//  ChatView.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-21.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                    MessageView(message: msg)
                }
            }.padding()
            
            HStack {
                TextField("Message...", text: $typingMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
                Button(action: sendMessage) {
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
    }
    
    func sendMessage() {
            chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
            typingMessage = ""
        }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView().environmentObject(ChatHelper())
    }
}
