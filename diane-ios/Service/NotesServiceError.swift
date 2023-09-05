//
//  AddNoteResponseError.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation

enum NotesServiceError: Error {
    case missingData(field: String)
    case internalError(reason: String)
}

extension NotesServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData(let field):
            return NSLocalizedString(
                "Field \(field) is missing in payload",
                comment: ""
            )
        case .internalError(let reason):
            return NSLocalizedString(
                "\(reason)",
                comment: ""
            )
        }
    }
}
