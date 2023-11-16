//
//  UILabel + ext.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 16.11.23.
//

import UIKit

extension UILabel {
    enum FontName: String {
        case sfProDisplay = "SFProDisplay-Regular"
        case cormorant = "CormorantInfant-Regular"
    }
    
    static func makeLabel(
        text: String,
        color: UIColor,
        fontName: FontName,
        and size: CGFloat = 64
    ) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName.rawValue, size: size)
        label.textColor = color
        label.textAlignment = .center
        label.text = text
        return label
    }
}
