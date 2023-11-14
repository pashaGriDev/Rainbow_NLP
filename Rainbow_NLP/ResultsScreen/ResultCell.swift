//
//  ResultCell.swift
//  Rainbow_NLP
//
//  Created by Юрий on 14.11.2023.
//

import UIKit

class ResultsCell: UICollectionViewCell {
    var gameNumberLabel = UILabel()
    var gameTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.contentView.addSubview(gameNumberLabel)
        gameNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNumberLabel.contentMode = .scaleAspectFit
        
        //self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            gameNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        self.contentView.addSubview(gameTimeLabel)
        gameTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTimeLabel.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            gameTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

