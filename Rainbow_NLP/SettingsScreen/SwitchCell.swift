//
//  SwitchCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

class SwitchCell: UICollectionViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        contentView.addSubview(nameLabel)
        contentView.addSubview(switchControl)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // nameLabel constraints
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // switchControl constraints
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with parameter: Parameter) {
        nameLabel.text = parameter.name
        switchControl.isOn = parameter.defaultValue as? Bool ?? false
    }
}
