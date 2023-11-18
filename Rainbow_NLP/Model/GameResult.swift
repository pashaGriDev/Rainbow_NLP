//
//  Statistics.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import Foundation

struct GameResult: Codable {
    let number: Int
    let time: Double // String
    var speed: Int?
    var result: String?
    
    var numberString: String {
        "Игра № \(number)"
    }
    
    var timeString: String {
        "время \(time)"
    }
}

extension GameResult {
    static func getMocResult() -> [GameResult] {
        [
            GameResult(number: 1, time: 2.3),
            GameResult(number: 2, time: 3.1),
            GameResult(number: 3, time: 2.5),
            GameResult(number: 4, time: 3.6),
            GameResult(number: 5, time: 2.3),
            GameResult(number: 6, time: 3.1),
            GameResult(number: 7, time: 2.5),
            GameResult(number: 8, time: 3.6)
        ]
    }
}

