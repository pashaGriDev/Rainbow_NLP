//
//  SliderCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

class SliderCell: UICollectionViewCell {
    //MARK: - UI Elements
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var minValue: Float = 0
    private var maxValue: Float = 0
    private var defaultValue: Float = 0
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(nameLabel)
        contentView.addSubview(slider)
        contentView.addSubview(valueLabel)
        setupConstraints()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.defaultPadding),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: Constants.defaultPadding),
            slider.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -Constants.defaultPadding),
            slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.defaultPadding),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Private methods
    @objc private func sliderValueChanged() {
        let value = round(slider.value)
        valueLabel.text = "\(Int(value))"
    }
    
    //MARK: - Cell config
    func configure(with parameter: Parameter) {
        nameLabel.text = parameter.name
        
        if let minValue = parameter.minValue, let maxValue = parameter.maxValue {
            slider.minimumValue = minValue
            slider.maximumValue = maxValue
            slider.value = (parameter.defaultValue as? Float) ?? minValue
            valueLabel.text = "\(Int(slider.value))"
        }
    }
}
