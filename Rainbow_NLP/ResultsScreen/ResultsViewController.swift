//
//  ResultsViewController.swift
//  Rainbow_NLP
//
//  Created by Юрий on 14.11.2023.
//

import UIKit

class ResultsViewController: BaseViewController {
    
    var collectionView: UICollectionView!
    let button = UIButton()
    let gameStatistics = GameStatistics.getMocResult()
    
//    lazy var button2: UIButton = {
//        let button = UIButton()
//        button.setTitle("Очистить статистику", for: .normal)
//        button.layer.cornerRadius = 12
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = #colorLiteral(red: 0.8707633615, green: 0.1323380172, blue: 0.1346192956, alpha: 1)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupButton()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        
        collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: "\(ResultsCell.self)")
        
        collectionView.backgroundColor = .lightGray
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = .init(width: 311.2, height: 85)
        layout.minimumLineSpacing = 20
        return layout
    }
    
    func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 63).isActive = true
        button.widthAnchor.constraint(equalToConstant: 268).isActive = true
        
        button.setTitle("Очистить статистику", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8707633615, green: 0.1323380172, blue: 0.1346192956, alpha: 1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        dismiss(animated: true)
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
