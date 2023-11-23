//
//  MainViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView: MainViewProtocol = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationController?.navigationBar.isHidden = true
        
        mainView.newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        mainView.resultGameButton.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
        mainView.settingGameButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        mainView.continueGameButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        mainView.rulesGameButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
    }
}


@objc extension MainViewController {
    func newGameButtonTapped() {
        print ("Go to new game")
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func rulesButtonTapped(_ sender: UIButton) {
        print ("Go to rules")
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func settingsButtonTapped(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func continueButtonTapped(_ sender: UIButton) {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
        print ("Go back to game")
    }
    
    func resultButtonTapped(_ sender: UIButton) {
        let vc = ResultsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
