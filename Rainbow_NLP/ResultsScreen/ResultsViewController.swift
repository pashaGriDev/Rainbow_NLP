//
//  ResultsViewController.swift
//  Rainbow_NLP
//
//  Created by Юрий on 14.11.2023.
//

import UIKit

class ResultsViewController: BaseViewController {
    
    var gameStatistics = GameStatistics.getMocResult()
    
    //MARK: - UI Elements
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = .init(width: 311.2, height: 85)
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: "\(ResultsCell.self)")
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    
    let cleanStatisticsButton: UIButton = .makeButton(
        text: "Очистить статистику",
        and: .newGameButtonColor
    )
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        cleanStatisticsButton.addTarget(
            self,
            action: #selector(cleanStatisticsButtonAction),
            for: .touchUpInside
        )
        collectionView.dataSource = self
    }
    
    //MARK: - Methods
    @objc func cleanStatisticsButtonAction() {
        gameStatistics = []
        collectionView.reloadData()
        
    }
    
    private func setViews() {
        setNavigationTitle = "Статистика"
        view.backgroundColor = .lightGray
        view.addSubview(collectionView, cleanStatisticsButton)
        isHiddenPauseButton = true
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        [collectionView, cleanStatisticsButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: K.heigh()),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cleanStatisticsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cleanStatisticsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            cleanStatisticsButton.heightAnchor.constraint(equalToConstant: 63),
            cleanStatisticsButton.widthAnchor.constraint(equalToConstant: 268),
        ])
    }
    
}

// MARK: UICollectionViewDataSource
extension ResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameStatistics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ResultsCell.self)", for: indexPath) as? ResultsCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 12
        cell.gameNumberLabel.text = gameStatistics[indexPath.row].numberString
        cell.gameNumberLabel.textColor = #colorLiteral(red: 0.9118689299, green: 0.1904129386, blue: 0.753595531, alpha: 1)
        cell.gameTimeLabel.text = gameStatistics[indexPath.row].timeString
        
        return cell
    }
}
