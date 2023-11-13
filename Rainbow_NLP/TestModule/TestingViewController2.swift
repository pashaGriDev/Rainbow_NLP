//
//  TestingViewController2.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

final class TestingViewController2: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle(text: "Test view 2")
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        print("override backButtonAction")
        navigationController?.popViewController(animated: true)
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        print("override pauseButtonAction")
    }
}
