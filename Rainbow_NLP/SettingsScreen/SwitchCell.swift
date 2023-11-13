//
//  SwitchCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

class SwitchCell: UICollectionViewCell {
    //MARK: - UI Elements
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
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(nameLabel)
        contentView.addSubview(switchControl)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.defaultPadding),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.defaultPadding),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Cell config
    func configure(with parameter: Parameter) {
        nameLabel.text = parameter.name
        switchControl.isOn = parameter.defaultValue as? Bool ?? false
    }
}