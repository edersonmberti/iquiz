//
//  LoginViewController.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 07/08/21.
//

import UIKit

protocol LoginViewProtocol: AnyObject {}

class LoginViewController: BaseViewController<LoginView> {
    
    lazy var presenter: LoginPresenterProtocol = LoginPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol {}
