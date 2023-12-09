//
//  Router.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 23.11.23.
//

import UIKit

protocol Router {
    var navigationController: UINavigationController { get }
    var assembly: AssemblyProtocol { get }
}

protocol RouterActionProtocol {
    func initController()
    func pushGame()
    func pushSettingGame()
    func pushRulesGame()
    func pop()
    func popToRoot()
}

typealias RouterProtocol = RouterActionProtocol & Router

final class RouterImp: RouterProtocol {
    // MARK: - Dependencies
    var navigationController: UINavigationController
    var assembly: AssemblyProtocol
    
    // MARK: - init(_:)
    init(
        navigationController: UINavigationController,
        assembly: AssemblyProtocol
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }
    
    // MARK: - Action
    func initController() {
        let mainViewController = assembly.makeMainViewController(router: self)
        navigationController.viewControllers = [mainViewController]
    }
    
    func pushGame() {
        print(#function)
    }
    
    func pushSettingGame() {
        let vc = SettingsViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushRulesGame() {
        let vc = RulesViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
