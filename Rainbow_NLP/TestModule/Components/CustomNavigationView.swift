//
//  CustomNavigationView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

final class CustomNavigationView: UIView {
    // MARK: - Private properties
    private struct Drawing {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let height: CGFloat = 110.0
        static let padding: CGFloat = 12.0
        static let backgroundColor: UIColor = .systemBlue
        static let fontSize: CGFloat = 22.0
    }
    
    // MARK: - Public properties
    let titleLabel = makeTitleLabel()
    let backButton = CustomNavBarButton(style: .back)
    let pauseButton = CustomNavBarButton(style: .pause)
    
    // MARK: - init(_:)
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Drawing.backgroundColor
        addSubview(backButton, titleLabel, pauseButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size = .init(
            width: Drawing.screenWidth,
            height: Drawing.height
        )
        setLayout()
    }
    
    // MARK: - Private methods
    private func setLayout() {
        [backButton, titleLabel, pauseButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Drawing.padding),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: backButton.heightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            
            pauseButton.widthAnchor.constraint(equalTo: backButton.widthAnchor),
            pauseButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            pauseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Drawing.padding),
            pauseButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
        ])
    }
}

extension CustomNavigationView {
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "Testing text"
         label.font = UIFont.systemFont(ofSize: Drawing.fontSize, weight: .regular)
        label.textAlignment = .center
        return label
    }
}
