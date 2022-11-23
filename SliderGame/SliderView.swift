//
//  UISliderView.swift
//  SliderGame
//
//  Created by ikorobov on 19.09.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha : Int
    
    var body: some View {
        VStack {
            Text("Move the slider as close as possible to: \(targetValue)")
            HStack {
                Text("0")
                CustomSliderView(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), targetValue: 50, color: .green, alpha: 100)
    }
}
