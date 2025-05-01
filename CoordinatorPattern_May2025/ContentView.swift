//
//  ContentView.swift
//  CoordinatorPattern_May2025
//
//  Created by mac on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    let items = ["Item1", "Item2", "Item3"]
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        List(items, id: \.self) { item in
            itemRow(item: item)
                .onTapGesture {
                    coordinator.gotoDetail(item: item)
                }
        }
        Button("Go to history") {
            coordinator.gotoHistory()
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button("Settings") {
                    coordinator.gotoSettings()
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Profile") {
                    coordinator.gotoProfile()
                }
            }
        }
    }
    
    func itemRow(item: String) -> some View {
        HStack {
            Text(item)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ContentView()
}

struct ItemDetailView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    let item: String
    
    var body: some View {
        Text("Detail for \(item)")
        
        Button("Item InDetail") {
            coordinator.gotoInDetail(item: item)
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        Text("Settings View")
    }
}

struct ProfileView: View {
    
    var body: some View {
        Text("Profile View")
    }
}

struct HistoryView: View {
    
    var body: some View {
        Text("History View")
    }
}

struct InDetailView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    let item: String
    
    var body: some View {
        VStack {
            Text("In Detail for \(item)")
            Button("back to home") {
                coordinator.goBackToHome()
            }
        }
    }
}
