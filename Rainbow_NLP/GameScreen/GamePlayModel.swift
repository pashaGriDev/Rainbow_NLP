//
//  GamePlayModel.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 17.11.2023.
//

import UIKit

class GamePlayModel {
    let colors: [UIColor] = [.red, .yellow, .orange, .purple, .blue, .black]
    let colorNames: [String] = ["Red", "Yellow", "Orange", "Purple", "Blue", "Black"]
    
    func getConfig() -> (text: String, color: UIColor) {
        return (text: colorNames.randomElement()!, color: colors.randomElement()!)
    }
}
