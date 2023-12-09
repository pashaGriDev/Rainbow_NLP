//
//  MainPresenter.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 21.11.23.
//

import Foundation

protocol MainPresenterProtocol {
    var router: RouterProtocol { get }
    func tappedNewGameButton() -> Void
    func tappedContinueGameButton() -> Void
    func tappedResultGameButton() -> Void
    func tappedSettingGameButton() -> Void
    func tappedRulesGameButton() -> Void
}

protocol MainPresenterDelegate {
    
}

final class MainPresenter: MainPresenterProtocol {
    // MARK: - Dependencies
    let router: RouterProtocol
        
    init(
        _ router: RouterProtocol
    ) {
        self.router = router
    }
}

extension MainPresenter {
    func tappedNewGameButton() {
        router.pushGame()
    }
    
    func tappedContinueGameButton() {
        print(#function)
    }
    
    func tappedResultGameButton() {
        print(#function)
    }
    
    func tappedSettingGameButton() {
        router.pushSettingGame()
    }
    
    func tappedRulesGameButton() {
        router.pushRulesGame()
    }
}
