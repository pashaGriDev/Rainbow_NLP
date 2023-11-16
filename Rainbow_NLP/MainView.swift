//
//  MainView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainView: UIView {
    private struct Drawing {
        static let height: CGFloat = 50.0
    }
    
    // MARK: - Private UI
    private let nlpLabel = MainView.makeNlpLabel()
    private let rainbowImage = MainView.makeRainbowImage()
    private let rainbowLabel = MainView.makeRainbowLabel()
    
    // MARK: - Public UI
    let newGameButton = MainView.makeNewGameButton()
    let settingButton = MainView.makeNewSettingsButton()
    let statsButton = MainView.makeNewStatsButton()
    let rulesButton = MainView.makeNewRulesButton()
    
    // MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        addSubview(
            rainbowImage,
            newGameButton,
            settingButton,
            rulesButton,
            statsButton,
            nlpLabel,
            rainbowLabel
        )
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    // MARK: - Private Methods
    private func setLayout() {
        NSLayoutConstraint.activate(
            [rainbowImage.topAnchor.constraint(equalTo: topAnchor, constant: K.heigh() / 2),
             rainbowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
             rainbowImage.widthAnchor.constraint(equalToConstant: 302),
             rainbowImage.heightAnchor.constraint(equalToConstant: 150),
             
             newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
             newGameButton.widthAnchor.constraint(equalToConstant: 274),
             newGameButton.heightAnchor.constraint(equalToConstant: 83),
             newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
             newGameButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 134.5),
             
             statsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
             statsButton.widthAnchor.constraint(equalToConstant: 274),
             statsButton.heightAnchor.constraint(equalToConstant: 83),
             statsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
             statsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 236.5),
             
             settingButton.widthAnchor.constraint(equalToConstant: Drawing.height),
             settingButton.heightAnchor.constraint(equalToConstant: Drawing.height),
             settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
             settingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
             
             rulesButton.widthAnchor.constraint(equalToConstant: 45),
             rulesButton.heightAnchor.constraint(equalToConstant: Drawing.height),
             rulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
             rulesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
             
             rainbowLabel.heightAnchor.constraint(equalToConstant: 131),
             rainbowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             rainbowLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             rainbowLabel.topAnchor.constraint(equalTo: topAnchor, constant: 238),
             rainbowLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 409),
             
             nlpLabel.heightAnchor.constraint(equalToConstant: 71),
             nlpLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             nlpLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             nlpLabel.topAnchor.constraint(equalTo: topAnchor, constant: 227)
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
        rainbowView.translatesAutoresizingMaskIntoConstraints = false
        return rainbowView
    }
    
    static func makeNlpLabel() -> UILabel {
        let nlp = UILabel()
        nlp.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        nlp.textColor = UIColor.black
        nlp.textAlignment = .center
        nlp.text = "НЛП игра"
        nlp.translatesAutoresizingMaskIntoConstraints = false
        return nlp
    }
    
    static func makeRainbowLabel() -> UILabel {
        let rainbow = UILabel()
        rainbow.font = UIFont(name: "CormorantInfant-Regular", size: 64)
        rainbow.textColor = UIColor.grayRainbowButton
        rainbow.textAlignment = .center
        rainbow.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeNewStatsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.newStatsButtonColor
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Статистика", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeNewSettingsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Settings button"), for: .normal)
        button.tintColor = UIColor.downButtons
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeNewRulesButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Rules button"), for: .normal)
        button.tintColor = UIColor.downButtons
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
