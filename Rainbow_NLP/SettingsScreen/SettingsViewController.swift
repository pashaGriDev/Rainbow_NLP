//
//  SettingsViewController.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 12.11.2023.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
    var parameters: [Parameter] = [
        Parameter(name: "Game time, sec", defaultValue: Float(10), type: .sliderCell, minValue: 2, maxValue: 60),
        Parameter(name: "Change speed, sec", defaultValue: Float(2), type: .sliderCell, minValue: 1, maxValue: 5),
        Parameter(name: "Enable layer", defaultValue: true, type: .switchCell, minValue: nil, maxValue: nil),
        Parameter(name: "Randon word position", defaultValue: false, type: .switchCell, minValue: nil, maxValue: nil)
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCell")
        collectionView.register(SwitchCell.self, forCellWithReuseIdentifier: "SwitchCell")
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
        for (index, parameter) in parameters.enumerated() {
            if let sliderCell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? SliderCell {
                sliderCell.configure(with: parameter)
            } else if let switchCell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? SwitchCell {
                switchCell.configure(with: parameter)
            }
        }
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        print("back to main screen")
    }
}

extension SettingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        parameters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let parameter = parameters[indexPath.item]
        
        switch parameter.type {
        case .sliderCell:
            let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
            sliderCell.configure(with: parameter)
            
            return sliderCell
        case .switchCell:
            let switchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwitchCell", for: indexPath) as! SwitchCell
            switchCell.configure(with: parameter)
            return switchCell
        }
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the desired size for each cell
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum line spacing between cells
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Return the content inset for the section
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
