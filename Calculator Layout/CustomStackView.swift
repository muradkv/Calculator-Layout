//
//  CustomStackView.swift
//  Calculator Layout
//
//  Created by murad on 16.09.2024.
//

import UIKit

class CustomStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    private func setupStackView() {
        distribution = .fillEqually
        spacing = 2
        translatesAutoresizingMaskIntoConstraints = false
    }
}
