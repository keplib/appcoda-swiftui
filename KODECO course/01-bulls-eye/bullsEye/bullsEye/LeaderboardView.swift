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
        Slider(value: .constant(50.0))
            .padding()
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
