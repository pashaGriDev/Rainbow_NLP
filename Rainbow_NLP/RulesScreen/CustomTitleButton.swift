//
//  CustomTitleButton.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 19.11.2023.
//

import UIKit

final class CustomTitleButton: UIButton {
    
    private var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 7).cgPath
            shadowLayer.fillColor = UIColor.green.cgColor
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 5)
            shadowLayer.shadowOpacity = 0.5
            shadowLayer.shadowRadius = 3
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
