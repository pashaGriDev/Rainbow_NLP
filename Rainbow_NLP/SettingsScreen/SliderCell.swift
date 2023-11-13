//
//  SliderCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

class SliderCell: UICollectionViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let slider: UISlider = {
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
    private var maxValue: Float = 60
    private var defaultValue: Float = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        contentView.addSubview(nameLabel)
        contentView.addSubview(slider)
        contentView.addSubview(valueLabel)
        setupConstraints()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // nameLabel constraints
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // slider constraints
            slider.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            slider.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -16),
            slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // valueLabel constraints
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    @objc private func sliderValueChanged() {
        let value = round(slider.value)
        valueLabel.text = "\(Int(value))"
    }
    
    func configure(with name: String, minValue: Float, maxValue: Float, defaultValue: Float) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.defaultValue = defaultValue
        
        
        nameLabel.text = name
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        slider.value = defaultValue
        valueLabel.text = "\(Int(defaultValue))"
    }
}
