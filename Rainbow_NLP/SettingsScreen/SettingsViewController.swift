//
//  SettingsViewController.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 12.11.2023.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
//    private let navigationBarView = CustomNavigationView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        collectionView.register(SwitchCell.self, forCellWithReuseIdentifier: "SwitchCollectionViewCell")
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    
    private lazy var restoreDefaultsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restore Defaults", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(restoreDefaultsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle(text: "Settings")
        
        view.backgroundColor = .lightGray
        view.addSubview(collectionView)
        view.addSubview(restoreDefaultsButton)
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor , constant: 16),
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: restoreDefaultsButton.topAnchor, constant: -16),
            
            restoreDefaultsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            restoreDefaultsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            restoreDefaultsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            restoreDefaultsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func restoreDefaultsButtonTapped() {
        // Add your code to restore the default settings of the app
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of settings you want to display
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCell
            // Configure the cell with label, slider, and value label
            cell.configure(with: "Parameter \(indexPath.item)", minValue: 1, maxValue: 60, defaultValue: 10)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwitchCollectionViewCell", for: indexPath) as! SwitchCell
            // Configure the cell with label and switch
            cell.configure(with: "Parameter \(indexPath.item)", isOn: true)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}
