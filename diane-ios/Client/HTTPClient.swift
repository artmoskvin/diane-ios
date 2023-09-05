//
//  HTTPDataDownloader.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation

protocol HTTPClient {
    func get(from url: URL) async throws -> Data
    func post(to url: URL, payload: Data) async throws -> Data
}

extension URLSession: HTTPClient {
    func get(from url: URL) async throws -> Data {
        let (data, response) = try await self.data(from: url, delegate: nil)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw HTTPError.statusCodeError(code: httpResponse.statusCode, message: nil)
        }
        return data
    }
    
    func post(to url: URL, payload: Data) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = payload
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await self.data(for: request, delegate: nil)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw HTTPError.statusCodeError(code: httpResponse.statusCode, message: nil)
        }
        return data
    }
}

enum HTTPError: LocalizedError {
    case statusCodeError(code: Int, message: String?)
    
    var errorDescription: String? {
        switch self {
        case .statusCodeError(let code, let message):
            return "HTTP Error with status code: \(code). \(message ?? "")"
        }
    }
    
    var errorCode: Int {
        switch self {
        case .statusCodeError(let code, _):
            return code
        }
    }
    
    var errorMessage: String? {
        switch self {
        case .statusCodeError(_, let message):
            return message
        }
    }
}

