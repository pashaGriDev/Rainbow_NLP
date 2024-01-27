//
//  SettingsViewController.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 12.11.2023.
//

import UIKit

//MARK: - Constants
private struct Constants {
    static let cornerRadius: CGFloat = 10
    static let defaultPadding: CGFloat = 16
    static let mediumPadding: CGFloat = 20
    static let largePadding: CGFloat = 50
    static let basicHeight: CGFloat = 80
    static let cellSpacing: CGFloat = 10
}

final class SettingsViewController: BaseViewController {
    // MARK: - Private properties
    private var userSetting = UserSetting()
    
    private var source: [CellSource] = CellSource.defaultValue()
    private let dataManager = DataManager<UserSetting>()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(
            SliderCell.self,
            forCellWithReuseIdentifier: String(describing: SliderCell.self)
        )
        collectionView.register(
            SwitchCell.self,
            forCellWithReuseIdentifier: String(describing: SwitchCell.self)
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    private lazy var restoreDefaultsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Значения по умолчанию", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .newGameButtonColor
        button.layer.cornerRadius = Constants.cornerRadius
        button.addTarget(self, action: #selector(restoreDefaultsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var sliderAction: (Float) -> Void = { [weak self] value in
        guard let self else { return }
        print("\(value)")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        setDelegates()
        
        do {
            let setting = try dataManager.load(by: .userSettingData)
            print(String(describing: setting))
            userSetting = setting
            // можно перенести настройки в ячейку
            source.enumerated().forEach { index, value in
                switch value {
                case .playTimeCell(var valueCell):
                    let newValue = Float(userSetting.gameTime)
                    valueCell.sliderValue = newValue
                    source[index] = .playTimeCell(valueCell)
                case .elementShowTimeCell(var valueCell):
                    let newValue = Float(userSetting.durationTime)
                    valueCell.sliderValue = newValue
                    source[index] = .elementShowTimeCell(valueCell)
                case .hasBackgroundCell(var valueCell):
                    valueCell.switchValue = userSetting.isBackground
                    source[index] = .hasBackgroundCell(valueCell)
                }
            }
            collectionView.reloadData()
            
            print("Loading of the user configuration was completed successfully")
        } catch {
            print(error.localizedDescription, "Loading default user setting")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Сохранение настроек пользователя
        do {
            try dataManager.save(self.userSetting, by: .userSettingData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Override Methods
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Methods
    @objc private func restoreDefaultsButtonTapped() {
        // установить значения по умолчанию
        guard !source.isEmpty else { return }
        
        let defaultSetting = CellSource.defaultValue()

        defaultSetting.enumerated().forEach { index, value in
            switch value {
            case .playTimeCell(let parameters):
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SliderCell
                cell.configure(with: parameters)
            case .elementShowTimeCell(let parameters):
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SliderCell
                cell.configure(with: parameters)
            case .hasBackgroundCell(let parameters):
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SwitchCell
                cell.configure(with: parameters)
            }
        }
        
        // Анимация
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setViews() {
        setNavigationTitle = "Настройки"
        view.backgroundColor = .lightGray
        view.addSubview(collectionView, restoreDefaultsButton)
        isHiddenPauseButton = true
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SettingsViewController: SliderCellDelegate {
    func getSliderData(_ cell: UICollectionViewCell, value: Float) {
        switch cell.tag {
        case 0: // cell is time slider
//            print("time: \(Int(value))")
            userSetting.gameTime = Int(value)
        case 1: // cell is time duration slider
//            print("duration: \(Int(value))")
            userSetting.durationTime = Int(value)
        default: return
        }
    }
}

extension SettingsViewController: SwitchCellDelegate {
    func switchHandler(_ cell: SwitchCell, value: Bool) {
        switch cell.tag {
        case 2:
            userSetting.isBackground = value
        default: return
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SettingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cellSetting = source[indexPath.row]
        
        switch cellSetting {
        case .playTimeCell(let parameters):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: SliderCell.self),
                for: indexPath
            ) as! SliderCell
            cell.tag = indexPath.row
            cell.delegate = self
            cell.configure(with: parameters)
            return cell
            
        case .elementShowTimeCell(let parameters):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: SliderCell.self),
                for: indexPath
            ) as! SliderCell
            cell.tag = indexPath.row
            cell.delegate = self
            cell.configure(with: parameters)
            return cell
            
        case .hasBackgroundCell(let parameters):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: SwitchCell.self),
                for: indexPath
            ) as! SwitchCell
            cell.tag = indexPath.row
            cell.delegate = self
            cell.configure(with: parameters)
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the desired size for each cell
        return CGSize(width: collectionView.bounds.width, height: Constants.basicHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum line spacing between cells
        return Constants.cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Return the content inset for the section
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}

//MARK: - Constraints
extension SettingsViewController {
    private func setupConstraints() {
        [collectionView, restoreDefaultsButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor , constant: Constants.defaultPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.mediumPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.mediumPadding),
            collectionView.bottomAnchor.constraint(equalTo: restoreDefaultsButton.topAnchor, constant: -Constants.defaultPadding),
            
            restoreDefaultsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.largePadding),
            restoreDefaultsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.largePadding),
            restoreDefaultsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.defaultPadding),
            restoreDefaultsButton.heightAnchor.constraint(equalToConstant: 63)
        ])
    }
}
