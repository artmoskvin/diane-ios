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
    
    var body: some Scene {
            WindowGroup {
                NoteList()
                    .environmentObject(notesData)
                    .environmentObject(chatHelper)
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
