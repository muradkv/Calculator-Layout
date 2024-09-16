//
//  ViewController.swift
//  Calculator Layout
//
//  Created by murad on 16.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topContainerView = UIView()
    
    private let mainVerticalStackView: UIStackView = {
        let stackView = CustomStackView(axis: .vertical)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainVerticalStackView)
        mainVerticalStackView.addArrangedSubview(topContainerView)
        
        setupTopContainerView()
        setupButtons()
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupTopContainerView() {
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topContainerView.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -10),
            resultLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor)
        ])
    }
    
    private func setupButtons() {
        let buttons: [[(String, UIColor)]] = [
            [("%", .darkGray), ("+/-", .darkGray), ("AC", .darkGray), ("÷", .lightOrange)],
            [("7", .lightBlue), ("8", .lightBlue), ("9", .lightBlue), ("x", .lightOrange)],
            [("4", .lightBlue), ("5", .lightBlue), ("6", .lightBlue), ("-", .lightOrange)],
            [("1", .lightBlue), ("2", .lightBlue), ("3", .lightBlue), ("+", .lightOrange)],
            [("0", .lightBlue), (".", .lightBlue), ("=", .lightOrange)]
        ]
        
        for row in buttons {
            let rowStackView = CustomStackView(axis: .horizontal)
            let lastTwoButtonsStackView = CustomStackView(axis: .horizontal)
            for (title, color) in row {
                let button = CustomButton(backgroundColor: color, title: title)
                
                if title == "." || title == "=" {
                    lastTwoButtonsStackView.addArrangedSubview(button)
                    rowStackView.addArrangedSubview(lastTwoButtonsStackView)
                } else {
                    rowStackView.addArrangedSubview(button)
                }
            }
            mainVerticalStackView.addArrangedSubview(rowStackView)
        }
    }
}

