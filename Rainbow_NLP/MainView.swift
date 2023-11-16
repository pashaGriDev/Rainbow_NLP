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
    }
    
    // MARK: - Private UI
    private let nlpLabel = MainView.makeNlpLabel()
    private let rainbowImage = MainView.makeRainbowImage()
    private let rainbowLabel = MainView.makeRainbowLabel()
    private lazy var buttonContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newGameButton, resultButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    // MARK: - Public UI
    let newGameButton = MainView.makeNewGameButton()
    let settingButton = MainView.makeNewSettingsButton()
    let resultButton = MainView.makeResultButton()
    let rulesButton = MainView.makeNewRulesButton()
    
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
             
             buttonContainer.topAnchor.constraint(equalTo: rainbowLabel.bottomAnchor, constant: 10),
             buttonContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             buttonContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
             buttonContainer.heightAnchor.constraint(equalToConstant: 160),
             
             settingButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
             settingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
             
             rulesButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
             rulesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ])
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
    
    static func makeNlpLabel() -> UILabel {
        let nlp = UILabel()
        nlp.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        nlp.textColor = UIColor.black
        nlp.textAlignment = .center
        nlp.text = "НЛП игра"
        return nlp
    }
    
    static func makeRainbowLabel() -> UILabel {
        let rainbow = UILabel()
        rainbow.font = UIFont(name: "CormorantInfant-Regular", size: 64)
        rainbow.textColor = UIColor.grayRainbowButton
        rainbow.textAlignment = .center
        rainbow.text = "Радуга"
        rainbow.attributedText = NSMutableAttributedString(string: "Радуга", attributes: [NSAttributedString.Key.kern: -0.3])
        return rainbow
    }
    static func makeNewGameButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.newGameButtonColor
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Новая игра", for: .normal)
        return button
    }
    
    static func makeResultButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.newStatsButtonColor
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Статистика", for: .normal)
        return button
    }
    
    static func makeNewSettingsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Settings button"), for: .normal)
        button.tintColor = UIColor.downButtons
        return button
    }
    
    static func makeNewRulesButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Rules button"), for: .normal)
        button.tintColor = UIColor.downButtons
        return button
    }
}
