//
//  CustomNavBarButton.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class CustomButton: UIButton {
    enum ButtonStyle {
        case back
        case pause
        case setting
        case rules
    }
    
    // MARK: - Private properties
    private var style: ButtonStyle
    private var color: UIColor
        
    // MARK: - init(_:)
    init(style: ButtonStyle, color: UIColor = .black) {
        self.style = style
        self.color = color
        super.init(frame: .zero)

        switch style {
        case .back:
            setImage(UIImage(named: "arrowLeft"), for: .normal)
        case .pause:
            setImage(UIImage(named: "pause"), for: .normal)
        case .setting:
            setImage(UIImage(named: "settings"), for: .normal)
        case .rules:
            setImage(UIImage(named: "question-mark"), for: .normal)
        }
        self.tintColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
