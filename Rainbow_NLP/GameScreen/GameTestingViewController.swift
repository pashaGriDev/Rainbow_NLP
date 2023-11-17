//
//  GameTestingViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 17.11.23.
//

import UIKit

class GameTestingViewController: BaseViewController {
    // MARK: - Dependencies
    private var timer: Timer?
    private var collectionView: UICollectionView!
    private let gamePlay = GamePlayModel()
    private var gameTime = 55
    var isGameRunning: Bool = true
    
    private var visualEffectView: UIVisualEffectView!
    private var isVisualEffectViewHidden = true
    
    private lazy var pauseLabel: UILabel = {
        let element = UILabel()
        element.text = "Pause"
        element.textAlignment = .center
        element.font = .boldSystemFont(ofSize: 50)
        element.textColor = .blue
        element.makeShadow()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        createVisualEffect()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startGame()
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        if isGameRunning {
            pause()
        } else {
            unpause()
        }
    }
    
    private func pause() {
        toggleVisualEffectView()
        isGameRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    private func unpause() {
        toggleVisualEffectView()
        isGameRunning = true
        startGame()
    }
    
    private func startGame() {
        timer = Self.makeGameTimer(target: self, selector: #selector(repeatTimer))
    }
    
    
    // Visual Effect
    private func createVisualEffect() {
            let blurEffect = UIBlurEffect(style: .light)
            visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.translatesAutoresizingMaskIntoConstraints = false
            visualEffectView.contentView.addSubview(pauseLabel)
            view.addSubview(visualEffectView)
            visualEffectView.isHidden = true
            NSLayoutConstraint.activate([
                
                visualEffectView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
                visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                pauseLabel.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
                pauseLabel.centerYAnchor.constraint(equalTo: visualEffectView.centerYAnchor),
                pauseLabel.widthAnchor.constraint(equalTo: visualEffectView.widthAnchor, multiplier: 0.5),
                pauseLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        }


    private func toggleVisualEffectView() {
            if isVisualEffectViewHidden {
                isVisualEffectViewHidden.toggle()
                visualEffectView.isHidden = false
                collectionView.isScrollEnabled = false
            } else {
                isVisualEffectViewHidden.toggle()
                visualEffectView.isHidden = true
                collectionView.isScrollEnabled = true
            }
        }
    
    
    
    
    @objc func repeatTimer() {
        gameTime -= 1
        setNavigationTitle = "\(gameTime)"
        
        let num = gameTime % 3
        if num == 0 {
            print("true")
            collectionView.reloadData()
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
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
    }
    
    func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 150, height: 50)
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
        let config = gamePlay.getConfig()
        cell.configure(text: config.text, and: config.color)
        return cell
    }
}

extension GameTestingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = self.collectionView.bounds.width - 150
        let height = self.collectionView.bounds.height - 50
        let top: CGFloat = Double.random(in: 0...height)
        let left: CGFloat = Double.random(in: 0...width)
        return .init(top: top, left: left, bottom: 0, right: 0)
    }
}

extension GameTestingViewController {
    static func makeGameTimer(target: Any, selector: Selector) -> Timer {
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: target,
            selector: selector,
            userInfo: nil,
            repeats: true
        )
        timer.tolerance = 0.2
        return timer
    }
}
