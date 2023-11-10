//
//  SampleView.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct SampleView: View {
    let item: TabBarItem
    let sectionTitles = ["Alpha", "Beta", "Gamma", "Delta", "Epsilon",
                         "Zeta", "Eta", "Theta", "Iota", "Kappa"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(sectionTitles, id: \.self) { title in
                        Text(title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<5) { index in
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundStyle(
                                            LinearGradient(
                                                colors: [.white, item.color.opacity(0.5), .black],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing)
                                        )
                                        .frame(width: 300, height: 200)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(item.title)
            .toolbar(content: {
                Image(systemName: "questionmark.circle")
            })
        }
    }
}


#Preview {
    SampleView(item: TabBarItem.home)
}
