//
//  NotesClient.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation

class NotesService: ObservableObject {
    
    func addNote(with transcript: String) async throws -> String {
        let payload: [String: Any] = ["transcript": transcript]
        let jsonData = try JSONSerialization.data(withJSONObject: payload)
        
        let data = try await client.post(to: baseURL, payload: jsonData)
        
        let response = try decoder.decode(AddNoteResponse.self, from: data)
        return response.note
    }
    
    func askNotes(with question: String) async throws -> String {
        guard let url = urlWithQueryParameters(baseURL.appendingPathComponent("ask"), parameters: ["q": question]) else {
            throw NotesServiceError.internalError(reason: "Can't create URL for question \(question)")
        }
        let data = try await client.get(from: url)
        let response = try decoder.decode(AskNotesResponse.self, from: data)
        return response.response
    }
    
    private lazy var decoder: JSONDecoder = JSONDecoder()
    
    private let baseURL = URL(string: "https://diane-be-ad87a53f0316.herokuapp.com/notes")!
    
    private let client: any HTTPClient
    
    init(client: any HTTPClient = URLSession.shared) {
        self.client = client
    }
    
    private func urlWithQueryParameters(_ url: URL, parameters: [String: String]) -> URL? {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents?.url
    }
}
