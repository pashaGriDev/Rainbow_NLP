//
//  SliderCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 13.11.2023.
//

import UIKit

private struct Constants {
    static let cornerRadius: CGFloat = 10
    static let defaultPadding: CGFloat = 16
    static let elementsSpacing: CGFloat = 25
}

class SliderCell: UICollectionViewCell {
    //MARK: - UI Elements
    
    private let nameLabel = makeLabel()
    private let valueLabel = makeLabel()
    private let slider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    private var minValue: Float = 0
    private var maxValue: Float = 0
    private var defaultValue: Float = 0
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(nameLabel, slider, valueLabel)
        setupConstraints()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
extension SliderCell {
    //MARK: - Constraints
    private func setupConstraints() {
        [nameLabel, slider, valueLabel].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.defaultPadding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.defaultPadding),
            slider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.defaultPadding),
            slider.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -Constants.defaultPadding),
            slider.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: Constants.elementsSpacing),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.defaultPadding),
            valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: Constants.elementsSpacing)
        ])
    }
}
