//
//  Statistics.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import Foundation

struct GameStatistics {
    let number: Int
    let time: Double
    var speed: Int?
    var result: String?
    
    var numberString: String {
        "Игра № \(number)"
    }
    
    var timeString: String {
        "время \(time)"
    }
    
    static func getMocResult() -> [GameStatistics] {
        [
            GameStatistics(number: 1, time: 2.3),
            GameStatistics(number: 2, time: 3.1),
            GameStatistics(number: 3, time: 2.5),
            GameStatistics(number: 4, time: 3.6),
            GameStatistics(number: 5, time: 2.3),
            GameStatistics(number: 6, time: 3.1),
            GameStatistics(number: 7, time: 2.5),
            GameStatistics(number: 8, time: 3.6)
        ]
    }
}
