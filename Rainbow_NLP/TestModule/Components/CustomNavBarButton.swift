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

//        switch style {
//        case .back:
//            setImage(UIImage(named: "arrowLeft"), for: .normal)
//        case .pause:
//            setImage(UIImage(named: "pause"), for: .normal)
//        }
        
        switch style {
        case .back:
            setImage(UIImage(systemName: "chevron.backward.2")?.withTintColor(.blue.withAlphaComponent(1.0), renderingMode: .alwaysOriginal), for: .normal)
        case .pause:
            setImage(UIImage(systemName: "pause.fill")?.withTintColor(.cyan.withAlphaComponent(0.5), renderingMode: .alwaysOriginal), for: .normal)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
