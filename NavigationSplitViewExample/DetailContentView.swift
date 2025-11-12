//
//  DetailContentView.swift
//  NavigationSplitViewExample
//
//  Created by Sukumar.Sukumaran on 12/11/2025.
//

import SwiftUI

struct DetailContentView: View {
    var selectedMessage: Message
    
    var body: some View {
        Text(selectedMessage.message)
    }
}

#Preview {
    DetailContentView(selectedMessage: Message(name: "Preview Name", message: "Preview Message"))
}
