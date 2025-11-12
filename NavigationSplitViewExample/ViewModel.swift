//
//  ViewModel.swift
//  NavigationSplitViewExample
//
//  Created by Sukumar.Sukumaran on 12/11/2025.
//

import SwiftUI
import Combine

struct Message: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let message: String
}

class ViewModel: ObservableObject {
    @Published var selectedMessage: Message?
    
    let allMessages: [Message] = [
        Message(name: "Chase", message: "Subscrible to m"),
        Message(name: "Alex", message: "sum burns "),
        Message(name: "Chase", message: "Subscrible to m")
    ]
}
