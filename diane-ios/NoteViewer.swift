//
//  NoteEditor.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI

struct NoteViewer: View {
    @Binding var note: Note
    @State var isNew = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: note.symbol)
                    .imageScale(.large)
                    .foregroundColor(Color(note.color))
                    .buttonStyle(.plain)
                    .padding(.horizontal, 5)
                
                TextField("Note title", text: $note.title)
                    .font(.title2)
            }
            .padding(.top, 20)
            
            TextEditor(text: $note.text)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct NoteEditor_Previews: PreviewProvider {
    @State static var bigNoteState = NotesExamples.bigNote
    @State static var smallNoteState = NotesExamples.smallNote
    
    static var previews: some View {
        NoteViewer(note: $bigNoteState, isNew: false)
        NoteViewer(note: $smallNoteState, isNew: false)
    }
}
