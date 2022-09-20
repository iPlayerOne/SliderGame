//
//  ContentView.swift
//  SliderGame
//
//  Created by ikorobov on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 5.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var thumbOpacity = 1.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Передвиньте слайдер как можно ближе к: \(targetValue)")
                .lineLimit(1)
                .font(.system(size: 15))
            
            HStack {
                Text("0")
                UISliderView(
                    currentValue: $currentValue,
                    targetValue: $targetValue,
                    thumbOpacity: $thumbOpacity
                )
                .onChange(of: currentValue) { newValue in
                    
                    
                }
                
                Text("100")
            }
            Button("Проверь меня!", action: { showAlert = true })
                .padding()
            Button("Начать заново", action: {
                showAlert = false
                currentValue = 0
                targetValue = Int.random(in: 0...100)
                
            })
        }
        .padding()
        .alert("Результат:", isPresented: $showAlert, actions: {}){
            Text("\(lround(thumbOpacity * 100))")
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
