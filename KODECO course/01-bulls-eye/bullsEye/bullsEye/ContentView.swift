//
//  ContentView.swift
//  bullsEye
//
//  Created by Balázs Képli on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    //@State private var challengeAlert: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var showValue: Double = 50.0
    
    @State private var game: Game = Game()
    
    
    var body: some View {

        VStack {
            Text(" 🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .font(.body)
                    .fontWeight(.bold)
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .font(.body)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            Button {
                self.alertIsVisible = !self.alertIsVisible
                self.showValue = self.sliderValue
                print(alertIsVisible)
            } label: {
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible) {
                var roundedSlider = Int(round(self.sliderValue))
                return Alert(title: Text("Alert is visible"),
                             message: Text("The slider's value is \(roundedSlider). \n Your points: \(self.game.points(sliderValue: roundedSlider))"),
                      dismissButton: .default(Text("Dismiss")))
            }
            Text("\(self.sliderValue)")
            
//            Button {
//                self.challengeAlert = !self.challengeAlert
//                print(challengeAlert)
//            } label: {
//                Text("Knock Knock")
//            }
//            .alert(isPresented: $challengeAlert) {
//                Alert(title: Text("Who is there"), message: Text("Little old lady"), dismissButton: .default(Text("Little lady who?")))
//            }
            Text("The slider's value is: \(Int(self.showValue))")
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
