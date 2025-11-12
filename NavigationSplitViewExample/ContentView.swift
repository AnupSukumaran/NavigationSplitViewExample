//
//  ContentView.swift
//  NavigationSplitViewExample
//
//  Created by Sukumar.Sukumaran on 12/11/2025.
//

import SwiftUI

struct Message: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let message: String
}


@Observable class ViewModel {
    var selectedMessage: Message?
    
    let allMessages: [Message] = [
        Message(name: "Chase", message: "Subscrible to m"),
        Message(name: "Alex", message: "sum burns "),
        Message(name: "Chase", message: "Subscrible to m")
    ]
    
}

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationSplitView {
            SidebarContentView(viewModel: viewModel)
        } detail: {
            if let selectedMessage = viewModel.selectedMessage {
                DetailContentView(selectedMessage: selectedMessage)
            } else if !viewModel.allMessages.isEmpty {
                DetailContentView(selectedMessage: viewModel.allMessages.first!)
            } else {
                ContentUnavailableView("Select a conversation", systemImage: "exclamationmark.bubble")
            }
           
        }

    }
}

#Preview {
    ContentView()
}
