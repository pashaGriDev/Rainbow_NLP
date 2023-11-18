//
//  GameViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 17.11.23.
//

import UIKit

struct UserSetting: Codable {
    let gameTime: Int
    ///  продолжительность отображения ячейки
    let durationTime: Int
    let isBackground: Bool
    
    init(
        gameTime: Int = 30,
        durationTime: Int = 3,
        isBackground: Bool = true
    ) {
        self.gameTime = gameTime
        self.durationTime = durationTime
        self.isBackground = isBackground
    }
}

class GameViewController: BaseViewController {
    // MARK: - Private properties
//    private var userSetting: UserSetting = .init() // maybe delete
    private let dataManager: DataManager = DataManager<UserSetting>()
    
    private var isGameRunning: Bool = true
    private var timer: Timer?
    private var collectionView: UICollectionView!
    private let gamePlay = GamePlayModel()
    
    private var isBackground = true
    private var gameTime = 15
    private var durationTime = 2
    
    private var visualEffectView: UIVisualEffectView = VisualEffectView(effect: UIBlurEffect(style: .light))
    private var isVisualEffectViewHidden = true
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "gameBgrnd")
        element.contentMode = .scaleAspectFill
        element.alpha = 0.3
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialStateView()
        setupCollectionView()
        createVisualEffect()
        setUserSetting()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startGame()
    }
    
    //MARK: - Methods
    private func initialStateView() {
        setNavigationTitle = "Подготовка..."
        view.addSubview(backgroundImageView)
        backgroundImageView.pinToNav(to: view, nav: navigationBarView)
    }
    
    private func setUserSetting() {
        do {
            let userSetting = try dataManager.load(by: .userSettingData)
//            self.userSetting = userSetting
            self.isBackground = userSetting.isBackground
            self.gameTime = userSetting.gameTime
            self.durationTime = userSetting.durationTime
        } catch {
            // !!!: Delete Moc Uset setting
            isBackground = true
            gameTime = 30
            durationTime = 5
            
            print(error.localizedDescription)
        }
    }
    
    private func pauseGame() {
        toggleVisualEffectView()
        isGameRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    private func playGame() {
        toggleVisualEffectView()
        isGameRunning = true
        startGame()
    }
    
    private func startGame() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0, // game speed
            target: self,
            selector: #selector(repeatTimer),
            userInfo: nil,
            repeats: true
        )
        timer?.tolerance = 0.2
    }
    
    
    //MARK: - Visual Blur Effect View
    private func createVisualEffect() {
        view.addSubview(visualEffectView)
        visualEffectView.frame = collectionView.frame
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
    
    // MARK: - Override Methods
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        
    }
    
    override func pauseButtonAction(_ sender: UIButton) {
        super.pauseButtonAction(sender)
        if isGameRunning {
            pauseGame()
        } else {
            playGame()
        }
    }
    
    //MARK: - Timer Imp
    @objc func repeatTimer() {
        gameTime -= 1
        setNavigationTitle = gameTime.toStringTimeFormat()
        
        if gameTime <= 0 {
            isHiddenPauseButton = true
            timer?.invalidate()
            timer = nil
            isGameRunning = false
            return
        }
        
        let num = gameTime % durationTime
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
private extension GameViewController {
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
        
        collectionView.backgroundColor = .clear
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
extension GameViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CustomCell.self),
            for: indexPath
        ) as! CustomCell
        
        switch isBackground {
        case true:
            let config = gamePlay.getConfig()
            cell.configure(text: config.text, and: config.color)
        case false:
            let config = gamePlay.getConfigNoBg()
            cell.configure(text: config.text, and: config.color)
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        
        let width = self.collectionView.bounds.width - 150
        let height = self.collectionView.bounds.height - 50
        let top: CGFloat = Double.random(in: 0...height)
        let left: CGFloat = Double.random(in: 0...width)
        
        return .init(top: top, left: left, bottom: 0, right: 0)
    }
}

extension Int {
    func toStringTimeFormat() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
