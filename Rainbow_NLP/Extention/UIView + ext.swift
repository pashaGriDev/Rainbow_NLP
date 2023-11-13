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
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
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
}
