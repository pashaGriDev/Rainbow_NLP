//
//  BaseViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Private properties
    let navigationBarView = CustomNavigationView()
    var isHiddenPauseButton: Bool {
        get { false }
        set { navigationBarView.pauseButton.isHidden = newValue }
    }
    /// default value is "Unknown"
    var setNavigationTitle: String {
        get { "Unknown" }
        set { navigationBarView.titleLabel.text = newValue }
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "gameBgrnd")
        element.contentMode = .scaleAspectFill
        element.alpha = 0.3
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        view.addSubview(backgroundImageView, navigationBarView)
        backgroundImageView.pinToNav(to: view, nav: navigationBarView)
        navigationController?.navigationBar.isHidden = true
        
        navigationBarView.backButton.addTarget(
            self,
            action: #selector(backButtonAction),
            for: .touchUpInside
        )
        navigationBarView.pauseButton.addTarget(
            self,
            action: #selector(pauseButtonAction),
            for: .touchUpInside
        )
    }
}

@objc extension BaseViewController {
    func backButtonAction(_ sender: UIButton) {
    }
    
    func pauseButtonAction(_ sender: UIButton) {
    }
}
