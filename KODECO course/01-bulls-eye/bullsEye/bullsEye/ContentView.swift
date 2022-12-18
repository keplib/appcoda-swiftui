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

        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
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
                .padding()
                Button {
                    self.alertIsVisible = !self.alertIsVisible
                    self.showValue = self.sliderValue
                    print(alertIsVisible)
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
                .foregroundColor(.white)
                .cornerRadius(21)
                
                .alert(isPresented: $alertIsVisible) {
                    var roundedSlider = Int(round(self.sliderValue))
                    return Alert(title: Text("Alert is visible"),
                                 message: Text("The slider's value is \(roundedSlider). \n Your points: \(self.game.points(sliderValue: roundedSlider))"),
                          dismissButton: .default(Text("Dismiss")))
                }
                
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
