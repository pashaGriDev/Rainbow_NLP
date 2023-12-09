//
//  MainViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Dependencies
    private let mainView: MainViewProtocol
    private let presenter: MainPresenterProtocol
    
    // MARK: - init(_:)
    init(
        mainView: MainViewProtocol,
        presenter: MainPresenterProtocol
    ) {
        self.mainView = mainView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    func setConstraints() {
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
        presenter.tappedNewGameButton()
//        print ("Go to new game")
//        let vc = GameViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func rulesButtonTapped(_ sender: UIButton) {
        presenter.tappedRulesGameButton()

//        print ("Go to rules")
//        let vc = RulesViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func settingsButtonTapped(_ sender: UIButton) {
        presenter.tappedSettingGameButton()
    }
    
    func continueButtonTapped(_ sender: UIButton) {
        presenter.tappedContinueGameButton()

//        let vc = GameViewController()
//        navigationController?.pushViewController(vc, animated: true)
//        print ("Go back to game")
    }
    
    func resultButtonTapped(_ sender: UIButton) {
        presenter.tappedResultGameButton()
    }
}
