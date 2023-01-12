//
//  LeaderboardView.swift
//  bullsEye
//
//  Created by Balázs Képli on 09/01/2023.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        RowView(index: 1, score: 10, date:Date())
        
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            Slider(value: .constant(50.0))
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity )
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: 480)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .preferredColorScheme(.light)
        LeaderboardView()
            .previewInterfaceOrientation(.landscapeLeft)
        LeaderboardView()
            .preferredColorScheme(.dark)
        LeaderboardView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
