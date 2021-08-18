//
//  RegistrationViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    
    func redirectToLogin()
    func updateLayout()
    func updateRegistrationLoading()
    func updateRegistrationSuccess()
    func updateRegistrationError(errorMessage: String)
}

class RegistrationViewController: BaseViewController<RegistrationView> {
    
    private lazy var presenter: RegistrationPresenterProtocol = RegistrationPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        setupNotificationObservers()
    }
    
    private func setupTextFields() {
        customView.emailTextField.delegate = self
        customView.passwordTextField.delegate = self
        customView.fullnameTextField.delegate = self
        customView.emailTextField.returnKeyType = .next
        customView.passwordTextField.returnKeyType = .next
        customView.fullnameTextField.returnKeyType = .done
    }
    
    private func setupNotificationObservers() {
        customView.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        customView.signUpButton.addTarget(self, action: #selector(signUpTouched), for: .touchUpInside)
        customView.alreadyAccountButton.addTarget(self, action: #selector(alreadyAccountTouched), for: .touchUpInside)
    }
    
    @objc private func signUpTouched() {
        presenter.signUp()
    }
    
    @objc private func alreadyAccountTouched() {
        presenter.alreadyAccount()
    }
    
    @objc private func textDidChange(_ sender: UITextField) {
        switch sender {
        case customView.emailTextField:
            presenter.updateFormValue(email: sender.text)
        case customView.passwordTextField:
            presenter.updateFormValue(password: sender.text)
        default:
            presenter.updateFormValue(fullname: sender.text)
        }
    }
}

extension RegistrationViewController: RegistrationViewProtocol {
    
    func updateLayout() {
        customView.signUpButton.isEnabled = presenter.isValid
    }

    func redirectToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateRegistrationLoading() {
        self.showLoader()
    }
    
    func updateRegistrationError(errorMessage: String) {
        self.hideLoader()
    }
    
    func updateRegistrationSuccess() {
        self.hideLoader()
        
        let MainTabBarController = MainTabBarController()
        navigationController?.pushViewController(MainTabBarController, animated: false)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case customView.emailTextField:
            customView.passwordTextField.becomeFirstResponder()
        case customView.passwordTextField:
            customView.fullnameTextField.becomeFirstResponder()
        default:
            presenter.signUp()
            textField.resignFirstResponder()
        }
        
        return true
    }
}
