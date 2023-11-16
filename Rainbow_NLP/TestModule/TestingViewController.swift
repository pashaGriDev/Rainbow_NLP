//
//  TestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

struct MocUser: Codable {
    var name: String
    var age: Int
    var raund: String
}

final class TestingViewController: BaseViewController {
    
    let dataManager = DataManager<[MocUser]>()
    let dataSource: [MocUser] = [
        .init(name: "Cat", age: 1, raund: "first"),
        .init(name: "Dog", age: 0, raund: "second")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle = "Test view"
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        print("save")
        do {
            try dataManager.save(dataSource, by: .userResultData)
        } catch DataManagerError.failedEncoded(let message) {
            print(message)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        print("load")
        do {
            let userData = try dataManager.load(by: .userResultData)
            print("\(String(describing: userData))")
        } catch DataManagerError.failedLoading(let message) {
            print(message)
        } catch DataManagerError.failedDecoded(let message) {
            print(message)
        } catch {
            print(error.localizedDescription)
        }
    }
}
