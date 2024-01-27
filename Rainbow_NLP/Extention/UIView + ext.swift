//
//  UIView + ext.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    /// Add a subview, constrained to the specified top, left, bottom and right margins.
    ///
    /// - Parameters:
    ///   - view: The subview to add.
    ///   - top: Optional top margin constant.
    ///   - left: Optional left (leading) margin constant.
    ///   - bottom: Optional bottom margin constant.
    ///   - right: Optional right (trailing) margin constant.
    ///
    func addConstraint(subview: UIView,
        top: CGFloat? = 0,
        left: CGFloat? = 0,
        right: CGFloat? = 0,
        bottom: CGFloat? = 0
    ) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        
        if let top {
            subview.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        }
        if let left {
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: left).isActive = true
        }
        if let right {
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -right).isActive = true
        }
        if let bottom {
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottom).isActive = true
        }
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leftAnchor.constraint(equalTo: superView.leftAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func pinToNav(to superView: UIView, nav: UIView) {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: nav.bottomAnchor),
                leftAnchor.constraint(equalTo: superView.leftAnchor),
                trailingAnchor.constraint(equalTo: superView.trailingAnchor),
                bottomAnchor.constraint(equalTo: superView.bottomAnchor)
            ])
        }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = .init(width: 0, height: 5)
        self.layer.shadowOpacity = 0.5
    }
    
    static func makeLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    enum GradientDirection {
        case horizontal
        case vertical
    }
// градиент цвета
    func createGradientLayer(
        from startColor: UIColor,
        to endColor: UIColor,
        direction: GradientDirection,
        frame: CGRect
    ) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        switch direction {
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        return gradientLayer
    }
}
