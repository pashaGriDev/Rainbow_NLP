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
            setImage(
                UIImage(
                    systemName: "chevron.backward.2"
                )?.withTintColor(
                    .blue.withAlphaComponent(
                        1.0
                    ),
                    renderingMode: .alwaysTemplate
                ).resized(
                    to: CGSize(
                        width: 25,
                        height: 25
                    )
                ),
                for: .normal
            )
        case .pause:
            setImage(
                UIImage(
                    systemName: "pause.fill"
                )?.withTintColor(
                    .cyan.withAlphaComponent(
                        0.5
                    ),
                    renderingMode: .alwaysTemplate
                ).resized(
                    to: CGSize(
                        width: 25,
                        height: 25
                    )
                ),
                for: .normal
            )
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//!!!: - Move to UIImage extension
extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
