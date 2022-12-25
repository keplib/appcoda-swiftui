//
//  Game.swift
//  bullsEye
//
//  Created by Balázs Képli on 16/12/2022.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var totalScore: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let difference: Int = abs(sliderValue - self.target)
        let awardedPoints: Int = 100 - difference
        return awardedPoints
    }
    
    mutating func startNewRound(points: Int) {
        self.totalScore = points
        self.round += 1
    }
}
