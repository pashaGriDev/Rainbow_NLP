//
//  RulesViewController.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 18.11.2023.
//

import UIKit

struct TextConstants {
    static let firstText = "На экране в случайном месте появляется слово, обозначающее цвет, например: написано «синий» :"
    static let secondText = "Нужно произнести вслух цвет текста слова (если опция в настройках «подложка для букв» выключена): \nговорим «зеленый»  \nили цвет фона, на котором написано слово (если опция в настройках «подложка для букв» включена):\nговорим «зеленый».\n\nВо время игры можно изменять скорость появления слов от 1x до 5x. \n\nВ настройках игры можно изменить: \n - длительность игры \n - скорость игры \n - включение/выключение подложки \n\nВаша цель - назвать правильно как можно больше верных цветов (в зависимости от выбранной настройки). \n\nУдачи и веселья."
}

class RulesView: UIView {
    private var scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class RulesViewController: BaseViewController {
    
    private let rulesView = RulesView()
    
    //MARK: - UI Elements
//    private var rulesScrollView = UIScrollView()
//    
//    private lazy var rulesContentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        return view
//    }()
//    
//    private lazy var firstTextView = UITextView(
//        text: TextConstants.firstText,
//        textToHighlight: ["«синий»"],
//        color: .systemGreen,
//        weight: .light,
//        size: 25
//    )
//    
//    private lazy var secondTextView = UITextView(
//        text: TextConstants.secondText,
//        textToHighlight: ["«зеленый»"],
//        color: .red,
//        weight: .regular,
//        size: 25
//    )
//    private lazy var firstHeadLabel = UILabel(withHeadTitle: "Подложка выключена:")
//    private lazy var secondHeadLabel = UILabel(withHeadTitle: "Подложка включена:")
//    private lazy var firstLabel = UILabel(withTitle: "cиний", textColor: .green)
//    
//    private lazy var secondLabel: CustomTitleButton = {
//        let label = CustomTitleButton(type: .system)
//        label.setTitle("синий", for: .normal)
//        label.isUserInteractionEnabled = false
//        label.tintColor = .white
//        label.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        return label
//    }()
//    
//    private lazy var mainStack = UIStackView(axis: .horizontal)
//    private lazy var firstStackLabel = UIStackView(axis: .vertical)
//    private lazy var secondStackLabel = UIStackView(axis: .vertical)
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
//        view = rulesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle = "Rules"
//        setViews()
//        addView()
//        setConstraints()
    }
    
    //MARK: - private Methods
//    private func setViews() {
//        setNavigationTitle = "Правила игры"
//        isHiddenPauseButton = true
//        view.backgroundColor = .clear
//        rulesScrollView.contentSize = rulesContentView.bounds.size
//        rulesScrollView.contentInsetAdjustmentBehavior = .always
//    }
//    
//    private func addView() {
//        view.addSubview(rulesScrollView)
//        rulesContentView.addSubview(firstTextView, mainStack, secondTextView)
//        firstStackLabel.addArrangedSubview(firstHeadLabel)
//        firstStackLabel.addArrangedSubview(firstLabel)
//        secondStackLabel.addArrangedSubview(secondHeadLabel)
//        secondStackLabel.addArrangedSubview(secondLabel)
//        mainStack.addArrangedSubview(firstStackLabel)
//        mainStack.addArrangedSubview(secondStackLabel)
//        rulesScrollView.addSubview(rulesContentView)
//    }
    
    //MARK: - Override methods
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        navigationController?.popViewController(animated: true)
    }
}

////MARK: - Convenience inits
//extension UILabel {
//    convenience init(withHeadTitle: String) {
//        self.init()
//        self.text = withHeadTitle
//        self.font = UIFont.boldSystemFont(ofSize: 15)
//    }
//    convenience init(withTitle: String, textColor: UIColor) {
//        self.init()
//        self.font = UIFont.boldSystemFont(ofSize: 30)
//        self.text = withTitle
//        self.textColor = textColor
//        self.makeShadow()
//    }
//}
//
//extension UIStackView {
//    convenience init(axis: NSLayoutConstraint.Axis) {
//        self.init()
//        self.axis = axis
//        self.alignment = .center
//        self.spacing = 15
//        self.distribution = .fillEqually
//    }
//}
//
//extension UITextView {
//    convenience init(text: String, textToHighlight: [String], color: UIColor, weight: UIFont.Weight, size: CGFloat) {
//        self.init()
//        self.attributedText = text.highlight(textToHighlight, this: color)
//        self.textAlignment = .natural
//        self.font = UIFont.systemFont(ofSize: size, weight: weight)
//        self.backgroundColor = .clear
//        self.isEditable = false
//        self.isScrollEnabled = false
//    }
//}
//
////MARK: - Constraints
//extension RulesViewController {
//    private func setConstraints() {
//        [rulesScrollView, rulesContentView, firstTextView, secondTextView, firstHeadLabel, firstLabel, secondHeadLabel, secondLabel, mainStack, firstStackLabel, secondStackLabel].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//        
//        NSLayoutConstraint.activate([
//            rulesScrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
//            rulesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            rulesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            rulesScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            
//            rulesContentView.topAnchor.constraint(equalTo: rulesScrollView.topAnchor),
//            rulesContentView.leadingAnchor.constraint(equalTo: rulesScrollView.leadingAnchor),
//            rulesContentView.trailingAnchor.constraint(equalTo: rulesScrollView.trailingAnchor),
//            rulesContentView.bottomAnchor.constraint(equalTo: rulesScrollView.bottomAnchor),
//            rulesContentView.widthAnchor.constraint(equalTo: rulesScrollView.widthAnchor),
//            
//            firstTextView.topAnchor.constraint(equalTo: rulesContentView.topAnchor, constant: 20),
//            firstTextView.leadingAnchor.constraint(equalTo: rulesContentView.leadingAnchor, constant: 20),
//            firstTextView.trailingAnchor.constraint(equalTo: rulesContentView.trailingAnchor, constant: -20),
//            firstTextView.heightAnchor.constraint(equalToConstant: 150),
//            
//            mainStack.topAnchor.constraint(equalTo: firstTextView.bottomAnchor),
//            mainStack.leadingAnchor.constraint(equalTo: rulesScrollView.leadingAnchor, constant: 20),
//            mainStack.trailingAnchor.constraint(equalTo: rulesScrollView.trailingAnchor, constant: -20),
//            
//            secondLabel.heightAnchor.constraint(equalToConstant: 40),
//            secondLabel.widthAnchor.constraint(equalToConstant: 150),
//            
//            secondTextView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20),
//            secondTextView.leadingAnchor.constraint(equalTo: rulesContentView.leadingAnchor, constant: 20),
//            secondTextView.trailingAnchor.constraint(equalTo: rulesContentView.trailingAnchor, constant: -20),
//            secondTextView.bottomAnchor.constraint(equalTo: rulesContentView.bottomAnchor, constant: -10),
//        ])
//    }
//}
