//
//  ProfileViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 09/08/21.
//

import UIKit
import React

protocol ProfileViewProtocol: AnyObject {
    
    func redirectToSignIn()
}

class ProfileViewController: BaseViewController<ProfileView> {
    
    lazy var presenter: ProfilePresenterProtocol = ProfilePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObservers()
    }
    
    func setupNotificationObservers() {
        customView.signOutButton.addTarget(self, action: #selector(signOutTouched), for: .touchUpInside)
    }
    
    @objc private func signOutTouched() {
        setupReactNativeScreen()
//        presenter.signOutTouched()
    }
    
    private func setupReactNativeScreen() {
        print("Hello")
        guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else { return }
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]

        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNHighScores",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
    func redirectToSignIn() {
        let loginController = LoginViewController()
        let navigation = UINavigationController(rootViewController: loginController)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: false, completion: nil)
    }
}
