//
//  MainViewElements.swift
//  Rainbow_NLP
//
//  Created by Дмитрий on 16.11.2023.
//

import Foundation

extension MainView {
    static func makeRainbowImage() -> UIImageView {
        let rainbowView = UIImageView()
        rainbowView.image = UIImage(named: "Rainbowimage")
        rainbowView.contentMode = .scaleAspectFit
        rainbowView.translatesAutoresizingMaskIntoConstraints = false
        return rainbowView
    }
    static func makeNlpLabel() -> UILabel {
        let nlp = UILabel()
        nlp.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        nlp.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nlp.textAlignment = .center
        nlp.text = "НЛП игра"
        nlp.translatesAutoresizingMaskIntoConstraints = false
        return nlp
    }
    static func makeRainbowLabel() -> UILabel {
        let rainbow = UILabel()
        rainbow.font = UIFont(name: "CormorantInfant-Regular", size: 64)
        rainbow.textColor = UIColor(red: 0.135, green: 0.169, blue: 0.153, alpha: 1)
        rainbow.textColor = .gray24
        rainbow.textAlignment = .center
        rainbow.translatesAutoresizingMaskIntoConstraints = false
        rainbow.text = "Радуга"
        rainbow.attributedText = NSMutableAttributedString(string: "Радуга", attributes: [NSAttributedString.Key.kern: -0.3])
        return rainbow
    }
    static func makeNewGameButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red:  0.871, green: 0.132, blue: 0.132, alpha: 1)
        button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Новая игра", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    static func makeNewStatsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.19, green: 0.65, blue: 0.29, alpha: 1)
        button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.setTitle("Статистика", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    static func makeNewStatsButtons() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Settings button"), for: .normal)
        button.tintColor = UIColor(red: 0.43, green: 0.04, blue: 0.44, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    static func makeNewRulesButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Rules button"), for: .normal)
        button.tintColor = UIColor(red: 0.43, green: 0.04, blue: 0.44, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
