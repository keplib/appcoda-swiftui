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
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            InstructionText(text:" 🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(text: "96")
        }
        
    }
}
