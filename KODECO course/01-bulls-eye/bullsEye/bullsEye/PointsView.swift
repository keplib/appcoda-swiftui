//
//  PointsView.swift
//  bullsEye
//
//  Created by Balázs Képli on 07/01/2023.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is:")
            BigNumberText(text: "50")
            BodyText(text: "You scored at 73 points\n 🎉🎉🎉 ")
            Button {
                
            } label: {
                ButtonText(text: "Start new round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
        PointsView()
            .preferredColorScheme(.dark)
        PointsView()
            .previewInterfaceOrientation(.landscapeLeft)
        PointsView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
