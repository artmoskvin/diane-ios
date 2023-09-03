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
    @EnvironmentObject var notesService: NotesService
    
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                    MessageView(message: msg)
                }
            }.padding()
            
            HStack {
                Spacer()
                
                Button(whisperState.isRecording ? "Stop recording" : "New note", action: {
                    Task {
                        if let transcript = await whisperState.toggleRecord() {
                            chatHelper.sendMessage(Message(content: transcript, user: DataSource.secondUser))
                            let note: String = try await notesService.addNote(with: transcript)
                            chatHelper.sendMessage(Message(content: "Noted: \(note)", user: DataSource.firstUser))
                        }
                    }
                })
                .font(.title)
                .padding(20)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
                Button(whisperState.isRecording ? "Stop recording" : "Query notes", action: {
                    Task {
                        if let transcript = await whisperState.toggleRecord() {
                            chatHelper.sendMessage(Message(content: transcript, user: DataSource.secondUser))
                            let response: String = try await notesService.askNotes(with: transcript)
                            chatHelper.sendMessage(Message(content: "\(response)", user: DataSource.firstUser))
                        }
                    }
                })
                .font(.title)
                .padding(20)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }.frame(minHeight: CGFloat(50)).padding(.horizontal)
            
            HStack {
                TextField("Message...", text: $typingMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
            }.padding()
        }
        
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView().environmentObject(ChatHelper()).environmentObject(WhisperState())
    }
}
