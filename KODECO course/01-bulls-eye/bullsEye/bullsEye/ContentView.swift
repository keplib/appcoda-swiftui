//
//  ContentView.swift
//  bullsEye
//
//  Created by Balázs Képli on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var challengeAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(" 🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .font(.body)
                    .fontWeight(.bold)
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .font(.body)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            Button {
                self.alertIsVisible = !self.alertIsVisible
                print(alertIsVisible)
            } label: {
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible) {
                Alert(title: Text("Alert is visible"), message: Text("Alert message"), dismissButton: .default(Text("Dismiss")))
            }
            
            Button {
                self.challengeAlert = !self.challengeAlert
                print(challengeAlert)
            } label: {
                Text("Knock Knock")
            }
            .alert(isPresented: $challengeAlert) {
                Alert(title: Text("Who is there"), message: Text("Little old lady"), dismissButton: .default(Text("Little lady who?")))
            }
            
           
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
