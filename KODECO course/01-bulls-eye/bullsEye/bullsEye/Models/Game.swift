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
        if (difference == 0) {
             return 200
        } else if (difference <= 2) {
             return  100 - difference + 50
        } else {
             return 100 - difference
        }
        
    }
    
    mutating func startNewRound(points: Int) {
        self.totalScore = points
        self.round += 1
        self.target = Int.random(in: 1...100)
        
        
    }
}
