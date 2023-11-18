//
//  UIColor + ext.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 16.11.23.
//

import UIKit

extension UIColor {
    static var grayRainbowButton: UIColor {
        UIColor(red: 0.135, green: 0.169, blue: 0.153, alpha: 1)
    }
    static var downButtons: UIColor {
        UIColor(red: 0.43, green: 0.04, blue: 0.44, alpha: 1)
    }
    //255, 0, 96, 1.0
    static var newGameButtonColor: UIColor {
        UIColor(red: 1, green: 0, blue: 0.376470588, alpha: 1)
    }
    // rgb(0, 223, 162)
    static var newStatsButtonColor: UIColor {
        UIColor(red: 0, green: 0.774509804, blue: 0.535294118, alpha: 1)
    }
    static var backgroundColor: UIColor {
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    }
    static var newContinueButtonColor: UIColor {
        UIColor(red: 0.183, green: 0.526, blue: 0.718, alpha: 1)
    }
}

extension UIColor {
    func contrastRatio(with color: UIColor) -> CGFloat {
        let luminance1 = self.luminance()
        let luminance2 = color.luminance()
        let contrast = (max(luminance1, luminance2) + 0.05) / (min(luminance1, luminance2) + 0.05)
        return contrast
    }
    
    private func luminance() -> CGFloat {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let redComponent = red <= 0.03928 ? red / 12.92 : pow((red + 0.055) / 1.055, 2.4)
        let greenComponent = green <= 0.03928 ? green / 12.92 : pow((green + 0.055) / 1.055, 2.4)
        let blueComponent = blue <= 0.03928 ? blue / 12.92 : pow((blue + 0.055) / 1.055, 2.4)
        
        let luminance = 0.2126 * redComponent + 0.7152 * greenComponent + 0.0722 * blueComponent
        return luminance
    }
    
    static func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
