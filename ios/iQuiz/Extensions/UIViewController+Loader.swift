//
//  UIViewController+Loader.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 17/08/21.
//

import UIKit

fileprivate var containerView: UIView?

extension UIViewController {
    
    func showLoader() {
        containerView = UIView(frame: self.view.bounds)
        containerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let boxView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        boxView.backgroundColor = Colors.surface
        boxView.layer.cornerRadius = 15
        boxView.center = containerView!.center
        
        let customSpinner = CustomSpinner()
        
        boxView.addSubview(customSpinner)
        
        containerView?.addSubview(boxView)
        self.view.addSubview(containerView!)
    }
    
    func hideLoader() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
}
