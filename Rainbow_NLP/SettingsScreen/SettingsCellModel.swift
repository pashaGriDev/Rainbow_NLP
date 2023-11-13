//
//  SettingsCellModel.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import Foundation

struct Parameter {
    let name: String
    let defaultValue: Any
    let type: CellType
    let minValue: Float?
    let maxValue: Float?
}

enum CellType {
    case sliderCell
    case switchCell
}
