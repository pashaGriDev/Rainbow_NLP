//
//  TestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class TestingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        print("override backButtonAction")
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        print("override pauseButtonAction")
    }
}
