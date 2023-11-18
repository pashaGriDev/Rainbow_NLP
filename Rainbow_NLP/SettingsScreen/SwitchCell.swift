//
//  SwitchCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

private struct Constants {
    static let cornerRadius: CGFloat = 10
    static let defaultPadding: CGFloat = 16
}

protocol SwitchCellDelegate: AnyObject {
    // change name
    func switchHandler(_ cell: SwitchCell, value: Bool) -> Void
}

class SwitchCell: UICollectionViewCell {
    weak var delegate: SwitchCellDelegate?
    
    //MARK: - UI Elements
    private let nameLabel = makeLabel()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        return switchControl
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(nameLabel, switchControl)
        setupConstraints()
        
        switchControl.addTarget(self, action: #selector(switchHandler), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func switchHandler(_ sender: UISwitch) {
        delegate?.switchHandler(self, value: switchControl.isOn)
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        [nameLabel, switchControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.defaultPadding),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.defaultPadding),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Cell config
    func configure(with parameters: CellSwitchCell) {
        nameLabel.text = parameters.title
        switchControl.isOn = parameters.switchValue
    }
}
