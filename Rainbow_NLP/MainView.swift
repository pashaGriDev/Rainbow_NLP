//
//  MainView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainView: UIView {
    // MARK: - Dependencies
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello world"
        return label
    }()
    
    // MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        self.addSubview(titleLabel)
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame.size = .init(width: 200, height: 50)
        titleLabel.center = self.center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
