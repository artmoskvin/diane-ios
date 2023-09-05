//
//  diane_iosApp.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI

@main
struct diane_iosApp: App {
    @StateObject private var notesData = NotesData()
    @StateObject private var chatHelper = ChatHelper()
    @StateObject private var whisperState = WhisperState()
    @StateObject private var notesService = NotesService()
    
    var body: some Scene {
            WindowGroup {
                NoteList()
                    .environmentObject(notesData)
                    .environmentObject(chatHelper)
                    .environmentObject(whisperState)
                    .environmentObject(notesService)
            }
        }
}

struct App_Previews: PreviewProvider {
    @StateObject private static var notesData = NotesData()
    static var previews: some View {
        NoteList()
            .environmentObject(notesData)
            .environmentObject(ChatHelper())
    }
}
