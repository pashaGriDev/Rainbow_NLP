//
//  TestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

final class TestingViewController: BaseViewController {
    
    let dataManager: DataManager = DataManagerImp()
    let dataSource: [MocUser] = [
        .init(name: "Bob", age: 10),
        .init(name: "Jon", age: 44)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle = "Test view"
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        print("save")
        dataManager.save(dataSource, by: .userResultData)
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        print("load")
        let userData = dataManager.load(by: .userResultData)
        print("\(String(describing: userData))")
    }
}
