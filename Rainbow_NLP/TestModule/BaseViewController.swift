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
    var setNavigationTitle: String {
        get { "Unknown" }
        set { navigationBarView.titleLabel.text = newValue }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        view.backgroundColor = .lightGray
        view.addSubview(navigationBarView)
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
