//
//  TestClient.swift
//  diane-iosTests
//
//  Created by Artem Moskvin on 2023-09-03.
//

import Foundation
@testable import diane_ios

class TestClient: HTTPClient {
    func get(from url: URL) async throws -> Data {
        fatalError("Unimplemented")
    }
    
    func post(to url: URL, payload: Data) async throws -> Data {
        fatalError("Unimplemented")
    }
}
