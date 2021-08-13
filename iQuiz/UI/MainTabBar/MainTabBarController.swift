//
//  MainTabController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.background
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let profile = ProfileViewController()
        
        viewControllers = [profile]
    }
}
