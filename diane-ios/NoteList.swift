//
//  NoteList.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI

struct NoteList: View {
    @EnvironmentObject var notesData: NotesData
    @State private var isAddingNewNote = false
    @State private var newNote = Note()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ChatView()
                } label: {
                    NewChatRow()
                }
                
                ForEach(notesData.sortedNotes()) { $note in
                    NavigationLink {
                        NoteViewer(note: $note)
                    } label: {
                        NoteRow(note: note)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            notesData.delete(note)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    // fixes empty title in navigation view
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Notes")
            .sheet(isPresented: $isAddingNewNote) {
                NavigationView {
                    NoteViewer(note: $newNote, isNew: true)
                }
            }
        }
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList()
            .environmentObject(NotesData())
            .environmentObject(ChatHelper())
    }
}
