//
//  Assembly.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 23.11.23.
//

import UIKit

protocol AssemblyProtocol {
    func makeMainViewController(router: RouterProtocol) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    func makeMainViewController(router: RouterProtocol) -> UIViewController {
        let view = MainView()
        let presenter = MainPresenter(router)
        let vc = MainViewController(mainView: view, presenter: presenter)
        
        return vc
    }
}
