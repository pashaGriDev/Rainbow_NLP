//
//  UIButton + ext.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 16.11.23.
//

import UIKit

extension UIButton {
    static func makeButton(
        text: String,
        and color: UIColor
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.backgroundColor = color
        return button
    }
}
