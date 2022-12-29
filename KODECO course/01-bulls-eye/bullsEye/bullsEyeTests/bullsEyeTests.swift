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
    
    
    func testScoreExact() {
        var guess = game.target
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        var guess = game.target + 2
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.totalScore, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.totalScore, 0)
        XCTAssertEqual(game.round, 1)
    }


}
