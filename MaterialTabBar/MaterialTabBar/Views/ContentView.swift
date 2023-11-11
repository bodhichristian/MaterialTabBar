//
//  ContentView.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        TabBarContainer(selection: $tabSelection) {
            SampleView(item: .home)
                .tabBarItem(tab: .home, 
                            selection: $tabSelection)
            
            SampleView(item: .favorites)
                .tabBarItem(tab: .favorites, 
                            selection: $tabSelection)
            
            SampleView(item: .messages)
                .tabBarItem(tab: .messages, 
                            selection: $tabSelection)
            
            SampleView(item: .profile)
                .tabBarItem(tab: .profile, 
                            selection: $tabSelection)
            
        }
    }
}

#Preview {
    ContentView()
}



