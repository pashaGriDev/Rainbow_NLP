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
//        button.titleLabel?.font = UIFont(name: "SF-Pro-Display-Regular", size: 40)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = color
        return button
    }
}
