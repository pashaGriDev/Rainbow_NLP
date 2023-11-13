//
//  BaseViewController.swift
//  Rainbow_NLP
//
//  Created by Павел Грицков on 13.11.23.
//

import UIKit

class TestingViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class BaseViewController: UIViewController {
    // MARK: - Dependencies
    var backgroundColor: UIColor = .lightGray
    let navigationBarView = CustomNavigationView()
    

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = backgroundColor
        view.addSubview(navigationBarView)
        navigationController?.navigationBar.isHidden = true
        
    }
}

// MARK: - CustomNavigationView
class CustomNavigationView: UIView {
    // MARK: - Private properties
    private struct Drawing {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let height: CGFloat = 110.0
        static let padding: CGFloat = 12.0
        static let backgroundColor: UIColor = .systemBlue
    }
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing text"
        label.textAlignment = .center
        return label
    }()
    private let backButton = CustomNavBarButton(style: .back)
    private let pauseButton = CustomNavBarButton(style: .pause)
    
    // MARK: - init(_:)
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Drawing.backgroundColor
        
        addSubview(backButton, titleLabel, pauseButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size = .init(
            width: Drawing.screenWidth,
            height: Drawing.height
        )
        setLayout()
    }
    
    // MARK: - Private methods
    private func setLayout() {
        [backButton, titleLabel, pauseButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Drawing.padding),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: backButton.heightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            
            pauseButton.widthAnchor.constraint(equalTo: backButton.widthAnchor),
            pauseButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            pauseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Drawing.padding),
            pauseButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
        ])
    }
}

// MARK: - CustomNavBarButton
class CustomNavBarButton: UIButton {
    enum ButtonStyle {
        case back
        case pause
    }
    // MARK: - Private properties
    private var style: ButtonStyle
    
    // MARK: - Public properties
    var action: ((UIButton) -> Void)?
    
    // MARK: - init(_:)
    init(style: ButtonStyle) {
        self.style = style
        super.init(frame: .zero)

        switch style {
        case .back:
            setImage(UIImage.arrowLeft, for: .normal)
        case .pause:
            setImage(UIImage.pause, for: .normal)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    @objc
    private func buttonTapped(_ sender: UIButton) {
        action?(sender)
        print(#function, "check nav button")
    }
}

// MARK: - UIView extension
extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leftAnchor.constraint(equalTo: superView.leftAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = .init(width: 0, height: 5)
        self.layer.shadowOpacity = 0.5
    }
}
