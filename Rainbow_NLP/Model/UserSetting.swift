//
//  UserSetting.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import Foundation

struct UserSetting: Codable {
    var gameTime: Int
    ///  продолжительность отображения ячейки
    var durationTime: Int
    var isBackground: Bool
    
    init(
        gameTime: Int = 30,
        durationTime: Int = 3,
        isBackground: Bool = true
    ) {
        self.gameTime = gameTime
        self.durationTime = durationTime
        self.isBackground = isBackground
    }
}
