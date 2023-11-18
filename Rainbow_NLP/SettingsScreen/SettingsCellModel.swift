//
//  SettingsCellModel.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import Foundation

enum CellType: CaseIterable {
    case playTimeCell
    case elementShowTimeCell
    case hasBackgroundCell
}

struct CellSliderModel: Equatable {
    let id: UUID = .init()
    let cellType: CellType
    let title: String
    var sliderValue: Float
    let minValue: Float
    let maxValue: Float
}

struct CellSwitchCell: Equatable {
    let id: UUID = .init()
    let cellType: CellType
    let title: String
    var switchValue: Bool
}


enum CellSource {
    case playTimeCell(CellSliderModel)
    case elementShowTimeCell(CellSliderModel)
    case hasBackgroundCell(CellSwitchCell)
}

extension CellSource {
    static func defaultValue() -> [CellSource] {
        return [
            .playTimeCell(
                .init(
                    cellType: .playTimeCell,
                    title: "Время игры, сек",
                    sliderValue: 30,
                    minValue: 10,
                    maxValue: 60
                )
            ),
            .elementShowTimeCell(
                .init(
                    cellType: .elementShowTimeCell,
                    title: "Скорость смены заданий, сек",
                    sliderValue: 2,
                    minValue: 1,
                    maxValue: 5
                )
            ),
            .hasBackgroundCell(
                .init(
                    cellType: .hasBackgroundCell,
                    title: "Фон для слов",
                    switchValue: true
                )
            )
        
        ]
    }
}

//
//struct Parameter {
//    let name: String
//    let defaultValue: Any
//    let type: CellType
//    let minValue: Float?
//    let maxValue: Float?
//}
//
//extension Parameter {
//    static func makeDataSourceForCell() -> [Parameter] {
//        return [
//            .init(
//                name: "Время игры, сек",
//                defaultValue: Float(10),
//                type: .sliderCell,
//                minValue: 2,
//                maxValue: 60
//            ),
//            .init(
//                name: "Скорость смены заданий, сек",
//                defaultValue: Float(2),
//                type: .sliderCell,
//                minValue: 1,
//                maxValue: 5
//            ),
//            .init(
//                name: "Подложка для букв",
//                defaultValue: true,
//                type: .switchCell,
//                minValue: nil,
//                maxValue: nil
//            )
//        ]
//    }
//}
