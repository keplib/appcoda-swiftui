//
//  ContentView.swift
//  appcoda-book
//
//  Created by Balázs Képli on 09/12/2022.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Guess These Movies")
                .font(.title)
                .fontWeight(.bold)
            Text("Can you guess the movies from these emojis?")
            Text("Tap the button to find out the answer")
            
            GameButton(buttonText: "Hello", bgColor: Color.blue)
            GameButton(buttonText: "World", bgColor: Color.orange)
            GameButton(buttonText: "Button", bgColor: Color.gray)
            GameButton(buttonText: "Test", bgColor: Color.pink)
            
        }
    }
}

func speak (phrase: String) {
    let utterance = AVSpeechUtterance(string: phrase)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GameButton: View {
    
    var buttonText: String
    var bgColor: Color
    var body: some View {
        Button {
            speak(phrase: buttonText)
        } label: {
            Text(buttonText)
                .font(.system(.title, design: .rounded))
                .padding()
        }
        .foregroundColor(.blue)
        .background(bgColor)
        .cornerRadius(20)
    }
}
