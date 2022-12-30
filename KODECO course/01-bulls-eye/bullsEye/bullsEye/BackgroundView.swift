//
//  BackgroundView.swift
//  bullsEye
//
//  Created by Balázs Képli on 20/12/2022.
//

import SwiftUI

struct BackgroundView: View {

    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing:5) {
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(title:"Score", text: String(game.totalScore))
            Spacer()
            NumberView(title:"Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            ForEach(1..<6) {ring in
                
                let size = CGFloat( ring * 100)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(colors: [Color("RingsColor").opacity(0.8 * 0.3),Color("RingsColor").opacity(0) ], center: .center, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
            
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
