//
//  AddNoteResponseTest.swift
//  diane-iosTests
//
//  Created by Artem Moskvin on 2023-09-03.
//

import XCTest
@testable import diane_ios

final class AddNoteResponseTest: XCTestCase {

    func testDecoderDecodesValidResponse() throws {
        let decoder = JSONDecoder()
        let response: Data = """
    {
      "note": "Test note"
    }
    """.data(using: .utf8)!
        
        let addNoteResponse = try decoder.decode(AddNoteResponse.self, from: response)
        XCTAssertEqual(addNoteResponse.note, "Test note")
    }
    
    func testDecoderThrowsErrorForInvalidResponse() throws {
        let decoder = JSONDecoder()
        let response: Data = """
    {
      "invalid": "Test note"
    }
    """.data(using: .utf8)!
        
        XCTAssertThrowsError(try decoder.decode(AddNoteResponse.self, from: response))
    }

}
