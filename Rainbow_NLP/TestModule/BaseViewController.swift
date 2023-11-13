//
//  BaseViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Dependencies
    var backgroundColor: UIColor = .lightGray
    let navigationBarView = CustomNavigationView()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = backgroundColor
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
