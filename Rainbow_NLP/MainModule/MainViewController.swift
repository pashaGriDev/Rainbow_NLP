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
        mainView.rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
    }
}


@objc extension MainViewController {
    func newGameButtonTapped() {
        print ("Go to new game")
    }
    
    func rulesButtonTapped(_ sender: UIButton) {
        print ("Go to rules")
    }
    
    func settingsButtonTapped(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func resultButtonTapped(_ sender: UIButton) {
        let vc = ResultsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
