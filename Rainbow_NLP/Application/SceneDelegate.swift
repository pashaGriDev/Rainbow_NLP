//
//  SceneDelegate.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        let assembly = Assembly()
        let router = RouterImp(navigationController: navigationController, assembly: assembly)
        router.initController()
        
        window?.rootViewController = router.navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

