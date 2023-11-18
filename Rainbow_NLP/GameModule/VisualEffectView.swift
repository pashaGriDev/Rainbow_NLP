//
//  VisualEffectView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 18.11.23.
//

import UIKit

class VisualEffectView: UIVisualEffectView {
    
    private lazy var pauseLabel: UILabel = {
        let element = UILabel()
        element.text = "Pause"
        element.textAlignment = .center
        element.font = .boldSystemFont(ofSize: 50)
        element.textColor = .blue
        element.makeShadow()
        return element
    }()
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        
        contentView.addSubview(pauseLabel)
        self.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pauseLabel.frame.size = CGSize(width: contentView.frame.width, height: 60)
        pauseLabel.center = contentView.center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
