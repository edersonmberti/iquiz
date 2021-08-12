//
//  ProfileView.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 09/08/21.
//

import UIKit

class ProfileView: UIView {
    
    let signOutButton: UIButton = {
        $0.setTitle("SignOut", for: .normal)
        return $0
    }(UIButton(type: .system))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemOrange
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(signOutButton)
    }
    
    func setupConstraints() {
        signOutButton.centerX(inView: self)
        signOutButton.centerY(inView: self)
    }
}
