//
//  MainViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        navigationController?.navigationBar.isHidden = true
    }
    
    func setup() {
        mainView.newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        mainView.resultButton.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
        mainView.settingButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        mainView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        mainView.rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
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
