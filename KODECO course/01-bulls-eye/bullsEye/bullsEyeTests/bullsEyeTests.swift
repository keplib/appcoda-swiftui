//
//  bullsEyeTests.swift
//  bullsEyeTests
//
//  Created by Balázs Képli on 17/12/2022.
//

import XCTest
@testable import bullsEye

class bullsEyeTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    

    func testScorePositive() {
        var guess = game.target + 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        var guess = game.target - 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.totalScore, 100)
        XCTAssertEqual(game.round, 2)
    }


}
