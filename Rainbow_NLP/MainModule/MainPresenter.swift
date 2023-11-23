//
//  MainPresenter.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 21.11.23.
//

import Foundation

protocol MainPresenterProtocol {
//    init(_ router: Router)
    func tappedNewGameButton() -> Void
    func tappedContinueGameButton() -> Void
    func tappedResultGameButton() -> Void
    func tappedSettingGameButton() -> Void
    func tappedRulesGameButton() -> Void
}

protocol MainPresenterDelegate {
    
}

final class MainPresenter: MainPresenterProtocol {
    
}

extension MainPresenter {
    func tappedNewGameButton() {
        print(#function)
    }
    
    func tappedContinueGameButton() {
        print(#function)

    }
    
    func tappedResultGameButton() {
        print(#function)

    }
    
    func tappedSettingGameButton() {
        print(#function)

    }
    
    func tappedRulesGameButton() {
        print(#function)

    }
}
