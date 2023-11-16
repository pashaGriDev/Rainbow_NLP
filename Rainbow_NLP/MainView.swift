//
//  MainView.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Elements
    let rainbowImage: UIImageView = {
        
        let rainbowView = UIImageView()
        
        rainbowView.image = UIImage(named: "Rainbowimage")
        rainbowView.contentMode = .scaleAspectFit
        rainbowView.translatesAutoresizingMaskIntoConstraints = false
        
        return rainbowView
    }()
    
    let nlpLabel: UILabel = {
        
        let nlp = UILabel()
        
        nlp.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        nlp.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nlp.textAlignment = .center
        nlp.text = "НЛП игра"
        nlp.translatesAutoresizingMaskIntoConstraints = false
        nlp.attributedText = NSMutableAttributedString(string: "НЛП игра", attributes: [NSAttributedString.Key.kern: -0.3])
        
        return nlp
    }()
    let rainbowLabel: UILabel = {
        
        let rainbow = UILabel()
        
        rainbow.font = UIFont(name: "CormorantInfant-Regular", size: 64)
        rainbow.textColor = UIColor(red: 0.135, green: 0.169, blue: 0.153, alpha: 1)
        rainbow.textAlignment = .center
        rainbow.translatesAutoresizingMaskIntoConstraints = false
        rainbow.attributedText = NSMutableAttributedString(string: "Радуга", attributes: [NSAttributedString.Key.kern: -0.3])
        return rainbow
    }()
    let newGameButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor(red:  0.871, green: 0.132, blue: 0.132, alpha: 1)
        button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Новая игра", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    let statsButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor(red: 0.19, green: 0.65, blue: 0.29, alpha: 1)
        button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Статистика", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    let settingsButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "Settings button"), for: .normal)
        button.tintColor = UIColor(red: 0.43, green: 0.04, blue: 0.44, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    let rulesButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "Rules button"), for: .normal)
        button.tintColor = UIColor(red: 0.43, green: 0.04, blue: 0.44, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    // MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.addSubview(rainbowImage)
        self.addSubview(newGameButton)
        self.addSubview(settingsButton)
        self.addSubview(rulesButton)
        self.addSubview(statsButton)
        self.addSubview(nlpLabel)
        self.addSubview(rainbowLabel)
        
    }
    
    // MARK: - Constraints
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // картинка радуги
        NSLayoutConstraint.activate([rainbowImage.topAnchor.constraint(equalTo: topAnchor, constant: 77),
                                     rainbowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     rainbowImage.widthAnchor.constraint(equalToConstant: 302),
                                     rainbowImage.heightAnchor.constraint(equalToConstant: 150)])
        
        
        // новая игра
        NSLayoutConstraint.activate([newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     newGameButton.widthAnchor.constraint(equalToConstant: 274),
                                     newGameButton.heightAnchor.constraint(equalToConstant: 83),
                                     newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
                                     newGameButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 134.5)
                                    ])
        // статистика
        NSLayoutConstraint.activate([statsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     statsButton.widthAnchor.constraint(equalToConstant: 274),
                                     statsButton.heightAnchor.constraint(equalToConstant: 83),
                                     statsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
                                     statsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 236.5)
                                    ])
        // настройки
        NSLayoutConstraint.activate([settingsButton.widthAnchor.constraint(equalToConstant: 50),
                                     settingsButton.heightAnchor.constraint(equalToConstant: 50),
                                     settingsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                                     settingsButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
                                    ])
        // правила
        NSLayoutConstraint.activate([rulesButton.widthAnchor.constraint(equalToConstant: 45),
                                     rulesButton.heightAnchor.constraint(equalToConstant: 50),
                                     rulesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
                                     rulesButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
                                    ])
        // надпись радуга
        NSLayoutConstraint.activate([rainbowLabel.widthAnchor.constraint(equalToConstant: 258),
                                     rainbowLabel.heightAnchor.constraint(equalToConstant: 131),
                                     rainbowLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
                                     rainbowLabel.topAnchor.constraint(equalTo: topAnchor, constant: 238),
                                     rainbowLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 409)
                                    ])
        // надпсь нлп игра
        NSLayoutConstraint.activate([nlpLabel.widthAnchor.constraint(equalToConstant: 206),
                                     nlpLabel.heightAnchor.constraint(equalToConstant: 71),
                                     nlpLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 81),
                                     nlpLabel.topAnchor.constraint(equalTo: topAnchor, constant: 227)
                                    ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
