//
//  UIColor + ext.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 16.11.2023.
//

import UIKit

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
}
