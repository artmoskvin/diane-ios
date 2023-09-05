//
//  AskNotesResponse.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation

struct AskNotesResponse {
    let response: String
}

extension AskNotesResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawResponse = try? values.decode(String.self, forKey: .response)
        
        guard let response = rawResponse
        else {
            throw NotesServiceError.missingData(field: "response")
        }
        
        self.response = response
    }
}
