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
        
        setupTextFields()
        setupNavigationBar()
        setupNotificationObservers()
    }
    
    private func setupTextFields() {
        customView.emailTextField.delegate = self
        customView.passwordTextField.delegate = self
        customView.emailTextField.returnKeyType = .next
        customView.passwordTextField.returnKeyType = .done
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func setupNotificationObservers() {
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
        presenter.login()
    }
    
    @objc private func dontHaveAccountTouched() {
        presenter.dontHaveAccount()
    }
    
    @objc private func textChanged(_ sender: UITextField) {
        if (sender == customView.emailTextField) {
            sender.text = sender.text?.lowercased()
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
        customView.loginButton.isEnabled = presenter.isValid
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

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customView.emailTextField {
            customView.passwordTextField.becomeFirstResponder()
        } else {
            presenter.login()
            textField.resignFirstResponder()
        }
        
        return true
    }
}
