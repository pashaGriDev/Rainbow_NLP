//
//  MainView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

protocol MainViewProtocol: UIView {
    var newGameButton: UIButton { get }
    var continueGameButton: UIButton { get }
    var resultGameButton: UIButton { get }
    var settingGameButton: CustomButton { get }
    var rulesGameButton: CustomButton { get }
}

final class MainView: UIView, MainViewProtocol {
    private struct Drawing {
        static let buttonSize: CGFloat = 50.0
        static let buttonPadding: CGFloat = 50.0
        static let buttonSpacing: CGFloat = 20.0
    }
    
    // MARK: - Public UI
    let newGameButton: UIButton = .makeButton(text: "Новая игра", and: .newGameButtonColor)
    let continueGameButton: UIButton = .makeButton(text: "Продолжить", and: .newContinueButtonColor)
    let resultGameButton: UIButton = .makeButton(text: "Статистика", and: .newStatsButtonColor)
    let settingGameButton: CustomButton = .init(style: .setting, color: .downButtons)
    let rulesGameButton: CustomButton = .init(style: .rules, color: .downButtons)
    
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
        let stackView = UIStackView(
            arrangedSubviews: [newGameButton, continueGameButton, resultGameButton]
        )
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = Drawing.buttonSpacing
        return stackView
    }()
    
    // MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        addSubview(
            rainbowImage,
            settingGameButton,
            rulesGameButton,
            nlpLabel,
            rainbowLabel,
            buttonContainer
        )
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private extension
private extension MainView{
    func setLayout() {[
            rainbowImage,
            nlpLabel,
            rainbowLabel,
            settingGameButton,
            rulesGameButton,
            buttonContainer,
            newGameButton,
            rulesGameButton,
            continueGameButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(
            [rainbowImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
             rainbowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
             rainbowImage.leadingAnchor.constraint(equalTo: leadingAnchor),
             rainbowImage.trailingAnchor.constraint(equalTo: trailingAnchor),
             rainbowImage.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
             
             nlpLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 70),
             nlpLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             nlpLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             nlpLabel.topAnchor.constraint(equalTo: rainbowImage.bottomAnchor),
             
             rainbowLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 130),
             rainbowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
             rainbowLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
             rainbowLabel.topAnchor.constraint(equalTo: nlpLabel.bottomAnchor),
             
             buttonContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Drawing.buttonPadding),
             buttonContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Drawing.buttonPadding),
             buttonContainer.bottomAnchor.constraint(equalTo: settingGameButton.topAnchor, constant: -20),
             buttonContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 250),
             
             settingGameButton.topAnchor.constraint(lessThanOrEqualTo: buttonContainer.bottomAnchor, constant: 20),
             settingGameButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingGameButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             settingGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
             settingGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
             
             rulesGameButton.widthAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesGameButton.heightAnchor.constraint(equalToConstant: Drawing.buttonSize),
             rulesGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
             rulesGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ])
    }
}

extension MainView {
    static func makeRainbowImage() -> UIImageView {
        let rainbowView = UIImageView()
        rainbowView.image = UIImage(named: "Rainbowimage")
        rainbowView.contentMode = .scaleAspectFit
        return rainbowView
    }
}
