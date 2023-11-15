//
//  ResultCell.swift
//  Rainbow_NLP
//
//  Created by Юрий on 14.11.2023.
//

import UIKit

class ResultsCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    var gameNumberLabel = UILabel()
    var gameTimeLabel = UILabel()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        self.contentView.addSubview(gameNumberLabel, gameTimeLabel)
        [gameNumberLabel, gameTimeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false; $0.contentMode = .scaleAspectFit
        }
        
        NSLayoutConstraint.activate([
            gameNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            gameNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gameTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            gameTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

