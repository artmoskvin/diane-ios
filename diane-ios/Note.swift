//
//  Note.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-19.
//

import SwiftUI


struct Note: Identifiable, Hashable {
    var id = UUID()
    var symbol: String = NoteSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var title = ""
    var text = ""
    var date = Date()
    
    static var delete = Note(symbol: "trash")
}
