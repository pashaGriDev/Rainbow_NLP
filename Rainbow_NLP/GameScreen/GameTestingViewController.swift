//
//  GameTestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 17.11.23.
//

import UIKit

/*
 
 */

class GamePlayModel {
    let colors: [UIColor] = [.red, .yellow, .orange, .purple, .blue, .black]
    
    func getConfig() -> (text: String, color: UIColor) {
        return (text: "Hello", color: colors.randomElement()!)
    }
}

class GameTestingViewController: BaseViewController {
    // MARK: - Dependencies
    private var timer: Timer?
    private var collectionView: UICollectionView!
    private let gamePlay = GamePlayModel()
    private var gameTime = 55
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        timer = Self.makeGameTimer(target: self, selector: #selector(repeatTimer))
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        timer?.invalidate()
        timer = nil
    }
    
    @objc func repeatTimer() {
        gameTime -= 1
        setNavigationTitle = "\(gameTime)"
        
        collectionView.reloadData()
//        if gameTime % 2 == 0 {
//            collectionView.reloadData()
//        }
    }
}

// MARK: - Private extension
private extension GameTestingViewController {
    func setupCollectionView() {
        let point = CGPoint(x: 0, y: K.heigh())
        let frame = CGRect(
            origin: point,
            size: CGSize(width: view.bounds.width, height: view.bounds.height - K.heigh())
        )
        collectionView = UICollectionView(frame: frame, collectionViewLayout: makeLayout())
        view.addSubview(collectionView)
        
        collectionView.register(
            CustomCell.self,
            forCellWithReuseIdentifier: String(describing: CustomCell.self)
        )
        
        collectionView.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
//        let lay = UICollectionViewLayout()
//        collectionView.setCollectionViewLayout(<#T##layout: UICollectionViewLayout##UICollectionViewLayout#>, animated: <#T##Bool#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = .init(top: 100, left: 30, bottom: 0, right: 0)
        layout.itemSize = .init(width: 100, height: 50)
        return layout
    }
}

// MARK: - UICollectionViewDataSource
extension GameTestingViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CustomCell.self),
            for: indexPath
        ) as! CustomCell
        print(#function, "+")
        let config = gamePlay.getConfig()
        cell.configure(text: config.text, and: config.color)
        return cell
    }
}

extension GameTestingViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print(#function, "size")
//        return .init(width: 100, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        print(#function, "inset")
        let width = self.collectionView.bounds.width - 100
        let height = self.collectionView.bounds.height - 50
        let top: CGFloat = Double.random(in: 0...height)
        let left: CGFloat = Double.random(in: 0...width)
        return .init(top: top, left: left, bottom: 0, right: 0)
    }
}

extension GameTestingViewController {
    static func makeGameTimer(target: Any, selector: Selector) -> Timer {
        let timer = Timer.scheduledTimer(
            timeInterval: 0.5,
            target: target,
            selector: selector,
            userInfo: nil,
            repeats: true
        )
        timer.tolerance = 0.6
        return timer
    }
}
