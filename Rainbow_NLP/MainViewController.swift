//
//  MainViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 12.11.23.
//

import UIKit


class MainViewController: UIViewController {
    
    let mainView = MainView()
    


    @objc func newGameButtonTapped () {
        print ("Go to new game")
        
    }
    @objc func rulesButtonTapped (_ sender: UIButton) {
        print ("Go to rules")
    }
    @objc func settingsButtonTapped (_ sender: UIButton) {
        print ("Go to settings")
    }
    @objc func statsButtonTapped (_ sender: UIButton) {
        print ("Go to stats")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
                
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
        
        
       
        
        // радуга картинка расположение
        
        
        // на завтра
        // разобраться с MainView и MainViewController
        // разобраться с расстоянием между леблами
        // выянить почему дебаггер ругается на констрейнты
        
        
     
    }

}

