//
//  TextViews.swift
//  bullsEye
//
//  Created by Balázs Képli on 18/12/2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .kerning(2.0)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
            .fontWeight(.black)
            .frame(width:35.0)
        
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.bold)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            
    }
}


struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(12.0)
            
    }
}


struct ScoreText: View {
    var score: Int
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            InstructionText(text:" 🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(text: "96")
            LabelText(text: "Score")
            LabelText(text: "Round")
            BodyText(text: "You scored 200 points!\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
        }
        .padding()
        
    }
}
