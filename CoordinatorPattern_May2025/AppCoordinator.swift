//
//  AppCoordinator.swift
//  CoordinatorPattern_May2025
//
//  Created by mac on 01/05/25.
//

import Foundation
import SwiftUI


enum AppRoute: Hashable {
    case home
    case detail(item: String)
    case settings
    case profile
    case history
    case inDetail(item: String)
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func gotoDetail(item: String) {
        path.append(AppRoute.detail(item: item))
    }
    
    func goBackToHome() { // Clears stack to root
        path.removeLast(path.count)
    }
    
    func gotoSettings() {
        path.append(AppRoute.settings)
    }
    
    func gotoProfile() {
        path.append(AppRoute.profile)
    }
    
    func gotoHistory() {
        path.append(AppRoute.history)
    }
    
    func gotoInDetail(item: String) {
        path.append(AppRoute.inDetail(item: item))
    }
    
}


struct CoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ContentView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        ContentView()
                    case .detail(let item):
                        ItemDetailView(item: item)
                    case .settings:
                        SettingsView()
                    case .profile:
                        ProfileView()
                    case .history:
                        HistoryView()
                    case .inDetail(let item):
                        InDetailView(item: item)
                    }
                }
        }
        .environmentObject(coordinator)
    }
}
