//
//  TabBarView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

//MARK: - Tabs
enum Tabs: Hashable {
    case userGroup
    case messanger
    case more
}

final class TabRouter: ObservableObject {
    @Published var selectedTab: Tabs = .userGroup
}

struct TabBarView: View {
    
    //MARK: - Private Properties
    @StateObject private var tabRouter: TabRouter = .init()
    
    //MARK: - LifeCycle
    init() {
        configure()
    }
    
    var body: some View {
        TabView(selection: $tabRouter.selectedTab) {
            configureTabView(for: .userGroup, view: ContactsNavBarView(), image: "userGroup")
            configureTabView(for: .messanger, view: Text("Чаты"), image: "messanger")
            configureTabView(for: .more, view: Text("Другие"), image: "more")
        }
        .tint(.brandColorButton)
        .environmentObject(tabRouter)
    }
}

//MARK: - Private Methods
extension TabBarView {
    private func configure() {
        let tabBar = UITabBar.appearance()
        tabBar.backgroundColor = .whitePurple
        tabBar.unselectedItemTintColor = .onboardLogoTitle
    }
    
    private func configureTabView<Content: View>(for tab: Tabs, view: Content, image: String) -> some View {
        view
            .tabItem {
                Image(image)
                    .renderingMode(.template)
                    .foregroundStyle(.titles)
            }
            .tag(tab)
    }
}

//MARK: - Preview
#Preview {
    TabBarView()
}
