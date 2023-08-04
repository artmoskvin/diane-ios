//
//  NewChatRow.swift
//  diane-ios
//
//  Created by Artem Moskvin on 2023-07-21.
//

import SwiftUI

struct NewChatRow: View {
    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text("New chat")
                        .fontWeight(.bold)
                }
            } icon: {
                Image(systemName: "mic.circle.fill")
                    .foregroundStyle(Color.red)
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
        }
        .frame(height: 40)
    }
}

struct NewChatRow_Previews: PreviewProvider {
    static var previews: some View {
        NewChatRow()
    }
}
