//
//  UIViewController+Keyboard.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 18/08/21.
//

import UIKit

extension UIViewController {
    
    func dismissKeyboardWhenTouchedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
