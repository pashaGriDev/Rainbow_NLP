//
//  CustomNavBarButton.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class CustomNavBarButton: UIButton {
    enum ButtonStyle {
        case back
        case pause
    }
    
    // MARK: - Private properties
    private var style: ButtonStyle
        
    // MARK: - init(_:)
    init(style: ButtonStyle) {
        self.style = style
        super.init(frame: .zero)

        switch style {
        case .back:
            setImage(UIImage.arrowLeft, for: .normal)
        case .pause:
            setImage(UIImage.pause, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
