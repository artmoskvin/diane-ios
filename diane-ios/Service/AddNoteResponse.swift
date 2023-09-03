//
//  AddNoteResponse.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation

struct AddNoteResponse {
    let note: String
}

extension AddNoteResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case note
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawNote = try? values.decode(String.self, forKey: .note)
        
        guard let note = rawNote
        else {
            throw NotesServiceError.missingData(field: "note")
        }
        
        self.note = note
    }
}
