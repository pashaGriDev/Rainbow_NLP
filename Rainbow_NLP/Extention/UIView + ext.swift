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
    
    func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
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

    func createGradientLayer(from startColor: UIColor, to endColor: UIColor, direction: GradientDirection, frame: CGRect) -> CAGradientLayer {
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
