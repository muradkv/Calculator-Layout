//
//  CustomButton.swift
//  Calculator Layout
//
//  Created by murad on 16.09.2024.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
