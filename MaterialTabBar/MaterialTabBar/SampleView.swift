//
//  SampleView.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct SampleView: View {
    let item: TabBarItem

    var body: some View {
        Text(item.title)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(item.color)
    }
}

#Preview {
    SampleView(item: TabBarItem.home)
}
