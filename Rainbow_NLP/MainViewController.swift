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
    }
    
    func setup() {
        mainView.newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        mainView.statsButton.addTarget(self, action: #selector(statsButtonTapped), for: .touchUpInside)
        mainView.settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        mainView.rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
    }
}


@objc extension MainViewController {
    func newGameButtonTapped () {
        print ("Go to new game")
        
    }
    func rulesButtonTapped (_ sender: UIButton) {
        print ("Go to rules")
    }
    func settingsButtonTapped (_ sender: UIButton) {
        print ("Go to settings")
    }
    func statsButtonTapped (_ sender: UIButton) {
        print ("Go to stats")
    }
}
