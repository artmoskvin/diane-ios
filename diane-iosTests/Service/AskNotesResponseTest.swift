//
//  AskNotesResponseTest.swift
//  diane-iosTests
//
//  Created by Artem Moskvin on 2023-09-03.
//

import XCTest
@testable import diane_ios

final class AskNotesResponseTest: XCTestCase {

    func testDecoderDecodesValidResponse() throws {
        let decoder = JSONDecoder()
        let rawResponse: Data = """
    {
      "response": "Test response"
    }
    """.data(using: .utf8)!
        
        let response = try decoder.decode(AskNotesResponse.self, from: rawResponse)
        XCTAssertEqual(response.response, "Test response")
    }
    
    func testDecoderThrowsErrorForInvalidResponse() throws {
        let decoder = JSONDecoder()
        let rawResponse: Data = """
    {
      "invalid": "Test"
    }
    """.data(using: .utf8)!
        
        XCTAssertThrowsError(try decoder.decode(AskNotesResponse.self, from: rawResponse))
    }

}
