//
//  NoteRow.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI

struct NoteRow: View {
    let note: Note
    
    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text(note.title)
                        .fontWeight(.bold)
                    
                    Text(note.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: note.symbol)
                    .foregroundStyle(Color(note.color))
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
        }
    }
}
