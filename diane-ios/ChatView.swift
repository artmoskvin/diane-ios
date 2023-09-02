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
    @EnvironmentObject var whisperState: WhisperState
    
    
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
                Button(whisperState.isRecording ? "Stop recording" : "Start recording", action: {
                    Task {
                        if let result = await whisperState.toggleRecord() {
                            chatHelper.sendMessage(Message(content: result, user: DataSource.secondUser))
                        } else {
                            print("dfghjdsfjkgh")
                        }
                    }
                })
            }.frame(minHeight: CGFloat(50)).padding()
        }
        .onAppear {
            Task {
//                await whisperState.transcribeSample()
//
            }
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
