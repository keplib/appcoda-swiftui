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
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
             bonus = 50
        } else {
             bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        self.totalScore = points
        self.round += 1
        self.target = Int.random(in: 1...100)
        
        
    }
    
    mutating func restart() {
        self.round = 1
        self.totalScore = 0
        self.target = Int.random(in: 1...100)
    }
}
