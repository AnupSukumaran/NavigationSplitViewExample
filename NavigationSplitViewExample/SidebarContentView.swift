//
//  SidebarContentView.swift
//  NavigationSplitViewExample
//
//  Created by Sukumar.Sukumaran on 12/11/2025.
//

import SwiftUI

struct SidebarContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.allMessages.isEmpty {
            VStack(spacing: 12) {
                Image(systemName: "cloud.circle")
                    .font(.system(size: 60))
                    .foregroundColor(.gray)
                Text("Downloading data...")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        } else {
            List(viewModel.allMessages, selection: $viewModel.selectedMessage) { item in
                Button {
                    viewModel.selectedMessage = item
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .bold()
                        Text(item.message)
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        
    }
}

#Preview {
    SidebarContentView(viewModel: ViewModel())
}
