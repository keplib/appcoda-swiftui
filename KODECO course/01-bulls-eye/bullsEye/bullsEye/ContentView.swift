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
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
               
                
    //            Button {
    //                self.challengeAlert = !self.challengeAlert
    //                print(challengeAlert)
    //            } label: {
    //                Text("Knock Knock")
    //            }
    //            .alert(isPresented: $challengeAlert) {
    //                Alert(title: Text("Who is there"), message: Text("Little old lady"), dismissButton: .default(Text("Little lady who?")))
    //            }
               
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: " 🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button {
            alertIsVisible = !alertIsVisible
        } label: {
            Text("Hit me!".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $alertIsVisible) {
            var roundedSlider = Int(round(sliderValue))
            return Alert(title: Text("Alert is visible"),
                         message: Text("The slider's value is \(roundedSlider). \n Your points: \(game.points(sliderValue: roundedSlider))"),
                  dismissButton: .default(Text("Dismiss")))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
