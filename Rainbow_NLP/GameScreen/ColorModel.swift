//
//  ColorModel.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 16.11.2023.
//

import UIKit

// Define an enum for the background colors
enum CellColor: CaseIterable {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case pink
    case teal
    case gray
    case brown
    case black
    case white
    
    static var allColors: [CellColor] {
        return [.red, .orange, .yellow, .green, .blue, .purple, .pink, .teal, .gray, .brown, .black, .white]
    }
    
    var name: String {
        switch self {
        case .red:
            return "Red"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .purple:
            return "Purple"
        case .pink:
            return "Pink"
        case .teal:
            return "Teal"
        case .gray:
            return "Gray"
        case .brown:
            return "Brown"
        case .black:
            return "Black"
        case .white:
            return "White"
        }
    }
    
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .orange:
            return UIColor.orange
        case .yellow:
            return UIColor.yellow
        case .green:
            return UIColor.green
        case .blue:
            return UIColor.blue
        case .purple:
            return UIColor.purple
        case .pink:
            return UIColor.systemPink
        case .teal:
            return UIColor.systemTeal
        case .gray:
            return UIColor.gray
        case .brown:
            return UIColor.brown
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        }
    }
}
