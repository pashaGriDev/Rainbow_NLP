//
//  MainView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainView: UIView {
    private struct Drawing {
        static let buttonSize: CGFloat = 50.0
        static let buttonPadding: CGFloat = 50.0
        static let buttonSpacing: CGFloat = 20.0
    }
    // MARK: - Private UI
    private let rainbowImage = MainView.makeRainbowImage()
    private let nlpLabel: UILabel = .makeLabel(
        text: "НЛП игра",
        color: .black,
        fontName: .sfProDisplay,
        and: 36
    )
    private let rainbowLabel: UILabel = .makeLabel(
        text: "Радуга",
        color: .grayRainbowButton,
        fontName: .cormorant
    )
    private lazy var buttonContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newGameButton, resultButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = Drawing.buttonSpacing
        return stackView
    }()
    
    // MARK: - Public UI
    let newGameButton: UIButton = .makeButton(text: "Новая игра", and: .newGameButtonColor)
    let resultButton: UIButton = .makeButton(text: "Статистика", and: .newStatsButtonColor)
    let settingButton: CustomButton = .init(style: .setting, color: .downButtons)
    let rulesButton: CustomButton = .init(style: .rules, color: .downButtons)
    
    // MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        addSubview(
            rainbowImage,
            settingButton,
            rulesButton,
            nlpLabel,
            rainbowLabel,
            buttonContainer
        )
        setLayout()
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Private Methods
    private func setLayout() {
        [
            rainbowImage,
            nlpLabel,
            rainbowLabel,
            settingButton,
            rulesButton,
            buttonContainer,
            newGameButton,
            resultButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(
            [rainbowImage.topAnchor.constraint(equalTo: topAnchor, constant: K.heigh() / 2),
             rainbowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
             rainbowImage.leadingAnchor.constraint(equalTo: leadingAnchor),
             rainbowImage.trailingAnchor.constraint(equalTo: trailingAnchor),
             rainbowImage.heightAnchor.constraint(equalToConstant: 150),
             
             nlpLabel.heightAnchor.constraint(equalToConstant: 70),
             nlpLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             nlpLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             nlpLabel.topAnchor.constraint(equalTo: rainbowImage.bottomAnchor),
             
             rainbowLabel.heightAnchor.constraint(equalToConstant: 130),
             rainbowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             rainbowLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             rainbowLabel.topAnchor.constraint(equalTo: nlpLabel.bottomAnchor),
             
             buttonContainer.topAnchor.constraint(equalTo: rainbowLabel.bottomAnchor,constant: 20),
             buttonContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Drawing.buttonPadding),
             buttonContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Drawing.buttonPadding),
             buttonContainer.heightAnchor.constraint(equalToConstant: 240),
             
             settingButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
             settingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
             
             rulesButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
             rulesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ])
        let backgroundImage = UIImage(named: "rainbowBackground")
        self.backgroundColor = UIColor(patternImage: backgroundImage!)
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    static func makeRainbowImage() -> UIImageView {
        let rainbowView = UIImageView()
        rainbowView.image = UIImage(named: "RainbowImage")
        rainbowView.contentMode = .scaleAspectFit
        return rainbowView
    }
}
