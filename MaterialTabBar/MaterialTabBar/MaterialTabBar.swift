//
//  MaterialTabBar.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct MaterialTabBar: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @State var localSelection: TabBarItem
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab)
                        }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.thinMaterial)
            }
            .ignoresSafeArea(edges: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .secondary.opacity(0.4), radius: 10, y: 5)
            .padding(.horizontal)
            .onChange(of: selection) { _, newValue in
                withAnimation(.bouncy(duration: 0.3)) {
                    localSelection = newValue
                }
            }
        }
    }
}

#Preview {
    MaterialTabBar(tabs: sampleTabs, selection: .constant(.home), localSelection: sampleTabs.first!)
}

extension MaterialTabBar {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            
            if tab == selection {
                Image(systemName: "\(tab.iconName).fill")
                    .font(.subheadline)
                    .symbolEffect(.bounce, value: localSelection)
                    .foregroundStyle(localSelection == tab ? tab.color : .secondary)
                    .frame(height: 15)
            } else {
                Image(systemName: tab.iconName)
                    .font(.subheadline)
                    .foregroundStyle(localSelection == tab ? tab.color : .secondary)
                    .frame(height: 15)
            }
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .foregroundStyle(localSelection == tab ? .primary : .secondary)
        }
        
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "tabHighlighting", in: namespace)
                }
            }
        )
    }
    
    private func switchToTab(_ newTab: TabBarItem) {
        selection = newTab
    }
}


