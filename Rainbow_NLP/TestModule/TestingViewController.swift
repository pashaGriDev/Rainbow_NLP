//
//  TestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

final class TestingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle(text: "Test view")
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        let vc = TestingViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }
}
