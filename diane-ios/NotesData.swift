//
//  NoteDate.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI


class NotesData: ObservableObject {
    @Published var notes: [Note] = [
        NotesExamples.bigNote,
        NotesExamples.smallNote
    ]
    
    func add(_ note: Note) {
            notes.append(note)
    }
    
    func delete(_ note: Note) {
        notes.removeAll { $0.id == note.id }
    }
    
    func exists(_ note: Note) -> Bool {
        notes.contains(note)
    }
    
    func sortedNotes() -> Binding<[Note]> {
        Binding<[Note]>(
            get: { self.notes.sorted { $0.date < $1.date } },
            set: { notes in
                for note in notes {
                    if let index = self.notes.firstIndex(where: { $0.id == note.id}) {
                        self.notes[index] = note
                    }
                }
            }
        )
    }
    
    func getBindingToNote(_ note: Note) -> Binding<Note>? {
        Binding<Note>(
            get: {
                guard let index = self.notes.firstIndex(where: { $0.id == note.id }) else { return Note.delete }
                return self.notes[index]
            },
            set: { note in
                guard let index = self.notes.firstIndex(where: { $0.id == note.id }) else { return }
                self.notes[index] = note
            }
        )
    }
    
    
}

struct NotesExamples {
    static let bigNote = Note(title: "What to hack on?", text: """
## Problem
                              
I have multiple hack ideas. But my free time is limited. So I need to choose what to hack on more strategically.

## Alternatives

### Continue hacking on Fluently

The idea behind Fluently is great. I believe that the problem of writing for non-native speakers is real but I think it’s not big enough. To use YC terms, a solution to this problem will be more like a vitamin than a pill. Also, there are too many existing competitors already in the market. Writing assistant is more like a feature for the existing text editors than a standalone product.

### AI engineer

This is big. I believe this is the future that we’re approaching really fast. It’s still early days and there are no big products except Github Copilot. As an engineer, I have a good understanding of the problem space. Plus, there’s a related project in Stockholm (gpt-engineer). I can find a community there and even potential cofounders. If I become an active contributor to gpt-engineer I’ll be on the edge of AI engineering. From there I will be able to steer wherever I want, e.g. PR copilot, production copilot, or language-based website builder.

### Decision

I decide to start hacking on AI engineering. My first goal is to become an active contributor to gpt-engineer.

### Follow-up

- [ ]  Find first issue and start working on it

### References

https://github.com/AntonOsika/gpt-engineer")
""")
    
    static let smallNote = Note(title: "Grocery list", text: """
* tomato
* cucumbers
* salad
* cheese
""")
}
