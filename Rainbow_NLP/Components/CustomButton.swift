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
            setImage(UIImage(systemName: "chevron.backward.2")?
                .withTintColor(.blue.withAlphaComponent(1.0),renderingMode: .alwaysTemplate)
                .resized(to: CGSize(width: 25, height: 25)),
                     for: .normal
            )
        case .pause:
            setImage(UIImage(systemName: "pause.fill")?
                .withTintColor(.cyan.withAlphaComponent(0.5),renderingMode: .alwaysTemplate)
                .resized(to: CGSize(width: 25, height: 25)),
                     for: .normal
            )
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
