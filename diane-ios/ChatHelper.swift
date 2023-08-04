//
//  ChatHelper.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-21.
//

import Combine

class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages: [Message] = DataSource.messages
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
    }
}
