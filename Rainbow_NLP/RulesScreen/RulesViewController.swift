//
//  GameViewController.swift
//  Rainbow_NLP
//
//  Created by User on 14.11.2023.
//

import UIKit


final class RulesViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        addConstraints()
        setViews()
        print(rulesView.frame.height)
        view.backgroundColor = UIColor.lightGray
    }
    
    private lazy var rulesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var rulesGameTitle: UILabel = {
        let label = UILabel()
        label.text = "ПРАВИЛА ИГРЫ"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var firstTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 48, width: 298, height: 163)
        textView.contentInset = UIEdgeInsets(top: 0, left: 26, bottom: 10, right: 9)
        let string = "На экране в случайном месте появляется слово, обозначающее цвет, например: написано «синий» :"
        let word = ["«синий»"]
        let text = string.highlight(word, this: .green)
        textView.attributedText = text
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = .clear
        textView.delegate = self
        return textView
    }()
    
    private lazy var secondTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 297, width: 298, height: 325)
        textView.contentInset = UIEdgeInsets(top: 0, left: 26, bottom: 10, right: 9)
        let string = "Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена):\nговорим «зеленый» .\n\nВ игре можно изменять скорость от 1x до 5x. А так же длительность игры."
        let word = ["говорим", "«зеленый»"]
        let text = string.highlight(word, this: .green)
        textView.attributedText = text
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = .clear
        textView.delegate = self
        return textView
    }()
    
    private lazy var firstHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Подложка выключена:"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "cиний"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 20)
        label.makeShadow()
        return label
    }()
    
    private lazy var secondHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Подложка включена:"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var secondLabel: CustomTitleButton = {
        let label = CustomTitleButton(type: .system)
        label.setTitle("синий", for: .normal)
        label.isUserInteractionEnabled = false
        label.tintColor = .white
        label.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var firstStackLabel: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private lazy var secondStackLabel: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private func setViews() {
        setNavigationTitle = "Помощь"
        isHiddenPauseButton = true
    }
    
    private func addView() {
        [rulesGameTitle, rulesView, firstStackLabel, secondStackLabel, firstLabel,firstHeadLabel, secondLabel, secondHeadLabel].forEach(view.setupView(_:))
        rulesView.addSubview(firstTextView)
        rulesView.addSubview(secondTextView)
        rulesView.addSubview(rulesGameTitle)
        firstStackLabel.addArrangedSubview(firstHeadLabel)
        firstStackLabel.addArrangedSubview(firstLabel)
        secondStackLabel.addArrangedSubview(secondHeadLabel)
        secondStackLabel.addArrangedSubview(secondLabel)
        rulesView.addSubview(firstStackLabel)
        rulesView.addSubview(secondStackLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            rulesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            rulesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37),
            rulesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 165),
            rulesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -53),
            rulesGameTitle.topAnchor.constraint(equalTo: rulesView.topAnchor, constant: 16),
            rulesGameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstStackLabel.topAnchor.constraint(equalTo: firstTextView.bottomAnchor),
            firstStackLabel.leadingAnchor.constraint(equalTo: rulesView.leadingAnchor, constant: 12),
            secondStackLabel.trailingAnchor.constraint(equalTo: rulesView.trailingAnchor, constant: -12),
            secondStackLabel.topAnchor.constraint(equalTo: firstTextView.bottomAnchor),
            secondLabel.heightAnchor.constraint(equalToConstant: 26),
            secondLabel.widthAnchor.constraint(equalToConstant: 94),
            secondTextView.bottomAnchor.constraint(equalTo: rulesView.bottomAnchor),
        ])
    }
    
    override func backButtonAction(_ sender: UIButton) {
        super.backButtonAction(sender)
        navigationController?.popViewController(animated: true)
    }
}

extension RulesViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return range.location < 300
    }
}

final class CustomTitleButton: UIButton {

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 9).cgPath
            shadowLayer.fillColor = UIColor.green.cgColor
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 5)
            shadowLayer.shadowOpacity = 0.5
            shadowLayer.shadowRadius = 3
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
