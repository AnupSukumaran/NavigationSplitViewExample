//
//  ContentView.swift
//  NavigationSplitViewExample
//
//  Created by Sukumar.Sukumaran on 12/11/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            SidebarContentView(viewModel: viewModel)
                .navigationTitle("Messages")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            // Add action
                        }) {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Add new message action
                        }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
                .navigationSplitViewColumnWidth(min: 250, ideal: 300, max: 600)
        } detail: {
            if let selectedMessage = viewModel.selectedMessage {
                DetailContentView(selectedMessage: selectedMessage)
                    .navigationTitle(selectedMessage.name)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                // Info action
                            }) {
                                Image(systemName: "info.circle")
                            }
                        }
                    }
            } else if !viewModel.allMessages.isEmpty {
                DetailContentView(selectedMessage: viewModel.allMessages.first!)
                    .navigationTitle(viewModel.allMessages.first!.name)
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.bubble")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("Select a conversation")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationSplitViewStyle(.balanced)

    }
}

#Preview {
    ContentView()
}
