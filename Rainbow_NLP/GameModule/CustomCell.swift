//
//  CustomCell.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 16.11.2023.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    func configure(text: String, and color: UIColor) {
        label.text = text
        contentView.backgroundColor = color
        
        var labelColor = UIColor.randomColor()
        while labelColor.contrastRatio(with: color) < 1.5 {
            labelColor = UIColor.randomColor()
        }
        label.textColor = labelColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
