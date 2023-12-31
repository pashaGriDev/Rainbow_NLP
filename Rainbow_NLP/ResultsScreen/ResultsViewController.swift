//
//  ResultsViewController.swift
//  Rainbow_NLP
//
//  Created by Юрий on 14.11.2023.
//

import UIKit

class ResultsViewController: BaseViewController {
    // MARK: - Public properties
    var lastGameResult: GameResult?
    
    // MARK: - Private properties
    private var gameResults: [GameResult] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    private let dataManager = DataManager<[GameResult]>()
    
    //MARK: - UI Elements
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = .init(width: 311.2, height: 85)
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: "\(ResultsCell.self)")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let cleanButton: UIButton = .makeButton(
        text: "Очистить статистику",
        and: .newGameButtonColor
    )
    private let bottomView = UIView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        cleanButton.addTarget(
            self,
            action: #selector(cleanStatisticsButtonAction),
            for: .touchUpInside
        )
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            let results = try dataManager.load(by: .userResultData)
            gameResults = results.reversed()
        } catch {
            print(error.localizedDescription)
            gameResults = GameResult.getMocResult().reversed()
        }
    }
    
    //MARK: - Methods
    @objc func cleanStatisticsButtonAction() {
        gameResults = []
        collectionView.reloadData()
        
    }
    
    private func setViews() {
        setNavigationTitle = "Статистика"
//        view.backgroundColor = .lightGray
        view.addSubview(collectionView, bottomView)
        bottomView.addSubview(cleanButton)
        isHiddenPauseButton = true
        bottomView.backgroundColor = .gray
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        [collectionView, cleanButton, bottomView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: K.heigh()),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cleanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cleanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            cleanButton.heightAnchor.constraint(equalToConstant: 63),
            cleanButton.widthAnchor.constraint(equalToConstant: 268),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            bottomView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
}

// MARK: UICollectionViewDataSource
extension ResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ResultsCell.self)", for: indexPath) as? ResultsCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = #colorLiteral(red: 0.8981253366, green: 0.8981253366, blue: 0.8981253366, alpha: 1)
        cell.layer.cornerRadius = 12
        cell.gameNumberLabel.text = gameResults[indexPath.row].numberString
        cell.gameNumberLabel.textColor = #colorLiteral(red: 0.9118689299, green: 0.1904129386, blue: 0.753595531, alpha: 1)
        cell.gameTimeLabel.text = gameResults[indexPath.row].timeString
        
        return cell
    }
}
