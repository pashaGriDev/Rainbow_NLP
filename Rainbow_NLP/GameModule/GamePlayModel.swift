//
//  GamePlayModel.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 17.11.2023.
//

import UIKit

class GamePlayModel {
    let colors: [UIColor] = [.red, .yellow, .orange, .purple, .blue, .black]
    let colorNames: [String] = ["Красный", "Желтый", "Оранжевый", "Фиолетовый", "Синий", "Черный"]
    
    func getConfig() -> (text: String, color: UIColor) {
        return (text: colorNames.randomElement()!, color: colors.randomElement()!)
    }
    
    func getConfigNoBg() -> (text: String, color: UIColor) {
        return (text: colorNames.randomElement()!, color: UIColor.clear)
    }
}
