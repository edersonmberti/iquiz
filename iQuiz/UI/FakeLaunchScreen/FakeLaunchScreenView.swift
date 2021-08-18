//
//  FakeLaunchScreenView.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

class FakeLaunchScreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.background
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeLaunchScreenView: ViewCode {
    
    func setupHierarchy() {}
    
    func setupConstraints() {}
}
