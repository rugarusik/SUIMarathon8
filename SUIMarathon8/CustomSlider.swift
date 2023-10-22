//
//  CustomSlider.swift
//  SUIMarathon8
//
//  Created by Alina Golubeva on 22/10/2023.
//

import SwiftUI

struct CustomSlider: View {
    
    let width: CGFloat = 80
    let height: CGFloat = 300
    
    @State private var progress: CGFloat = 0.3
    @State private var anim = false
    
    private var yScale: CGFloat {
        progress >= 1 || progress <= 0 ? 1.05 : 1
    }
    
    private var xScale: CGFloat {
        progress >= 1 || progress <= 0 ? 0.9 : 1
    }
    
    private var anchor: UnitPoint {
        progress > 0.5 ? .bottom : .top
    }
    
    var body: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(.white)
                    .scaleEffect(y: progress, anchor: .bottom)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .scaleEffect(x: xScale, y: yScale, anchor: anchor)
            .animation(.spring(dampingFraction: 0.7), value: progress)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        progress = max(min((1 - value.location.y / 300), height), 0)
                        print(progress)
                    }
                    .onEnded { _ in
                        progress = 0.3
                    }
            )
            .frame(width: width, height: height)
    }
}
