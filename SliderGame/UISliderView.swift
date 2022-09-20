//
//  UISliderView.swift
//  SliderGame
//
//  Created by ikorobov on 19.09.2022.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    @Binding var thumbOpacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
        uiView.thumbTintColor = .red.withAlphaComponent(thumbOpacity)
    }
    
    func makeCoordinator() -> UISliderView.Coordinator {
        Coordinator(currentValue: $currentValue, targetValue: $targetValue, thumbOpacity: $thumbOpacity)
    }
    
}
    
    extension UISliderView {
        
        class Coordinator: NSObject {
            
            @Binding var currentValue: Double
            @Binding var targetValue: Int
            @Binding var thumbOpacity: Double
           
    
            init(currentValue: Binding<Double>, targetValue: Binding<Int>, thumbOpacity: Binding<Double> ) {
                self._currentValue = currentValue
                self._targetValue = targetValue
                self._thumbOpacity = thumbOpacity
                
            }
            
            @objc func valueChanged(_ sender: UISlider) {
                currentValue = Double(sender.value)
                thumbOpacity = Double(computeScore()) / 100
                
            }
            
            private func computeScore() -> Int {
                let difference = abs(targetValue - lround(currentValue))
                return 100 - difference
            }
        }
    }

struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        UISliderView(currentValue: .constant(45), targetValue: .constant(50), thumbOpacity: .constant(30))
    }
}
