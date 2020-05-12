//
//  ContentView.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/9/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RecentView().tabItem {
                TabBarItem(imageName: "chart.bar", text: "Recen")
            }.tag(0)
        }
    }
}

private struct TabBarItem: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
