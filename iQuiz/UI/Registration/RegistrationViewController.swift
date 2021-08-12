//
//  RegistrationViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    
    func redirectToLogin()
    func redirectToMainTabBar()
}

class RegistrationViewController: BaseViewController<RegistrationView> {
    
    lazy var presenter: RegistrationPresenterProtocol = RegistrationPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObservers()
    }
    
    func setupNotificationObservers() {
        customView.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.signUpButton.addTarget(self, action: #selector(signUpTouched), for: .touchUpInside)
        customView.alreadyAccountButton.addTarget(self, action: #selector(alreadyAccountTouched), for: .touchUpInside)
    }
    
    @objc private func signUpTouched() {
        presenter.signUpTouched()
    }
    
    @objc private func alreadyAccountTouched() {
        presenter.alreadyAccountTouched()
    }
    
    @objc private func textDidChange(_ sender: UITextField) {
        switch sender {
        case customView.emailTextField:
            presenter.updateEmail(with: sender.text)
        case customView.passwordTextField:
            presenter.updatePassword(with: sender.text)
        default:
            presenter.updateFullname(with: sender.text)
        }
    }
}

extension RegistrationViewController: RegistrationViewProtocol {
    
    func redirectToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    func redirectToMainTabBar() {
        let MainTabBarController = MainTabBarController()
        navigationController?.pushViewController(MainTabBarController, animated: true)
    }
}
