//
//  ContentView.swift
//  SUIMarathon8
//
//  Created by Alina Golubeva on 21/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .blur(radius: 10)
            CustomSlider()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
