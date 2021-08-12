//
//  LoginViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit
import Firebase

protocol LoginViewProtocol: AnyObject {
    
    func redirectToRegistration()
    func updateLayout()
    func updateLoading()
    func updateLoginSuccess()
    func updateLoginError(errorMessage: String)
}

class LoginViewController: BaseViewController<LoginView> {
    
    lazy var presenter: LoginPresenterProtocol = LoginPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupNotificationObservers()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    func setupNotificationObservers() {
        customView.emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        customView.passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        customView.loginButton.addTarget(self, action: #selector(loginTouched), for: .touchUpInside)
        customView.dontHaveAccountButton.addTarget(self, action: #selector(dontHaveAccountTouched), for: .touchUpInside)
    }
    
    private func setEnabledForm(enabled: Bool) {
        customView.emailTextField.isEnabled = enabled
        customView.passwordTextField.isEnabled = enabled
        customView.loginButton.isEnabled = enabled
    }
    
    @objc private func loginTouched() {
        presenter.loginTouched()
    }
    
    @objc private func dontHaveAccountTouched() {
        presenter.dontHaveAccountTouched()
    }
    
    @objc private func textChanged(_ sender: UITextField) {
        if (sender == customView.emailTextField) {
            presenter.updateEmail(with: sender.text ?? "")
        } else {
            presenter.updatePassword(with: sender.text ?? "")
        }
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func redirectToRegistration() {
        let registrationController = RegistrationViewController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
    
    func updateLayout() {
        if presenter.isValid {
            customView.loginButton.alpha = 1.0
            customView.loginButton.isEnabled = true
        } else {
            customView.loginButton.alpha = 0.7
            customView.loginButton.isEnabled = false
        }
    }
    
    func updateLoading() {
        setEnabledForm(enabled: false)
    }
    
    func updateLoginError(errorMessage: String) {
        print("DEBUG: Login error with \(errorMessage)")
        setEnabledForm(enabled: true)
    }
    
    func updateLoginSuccess() {
        setEnabledForm(enabled: true)
        
        let mainTabBarController = MainTabBarController()
        navigationController?.pushViewController(mainTabBarController, animated: false)
    }
}
