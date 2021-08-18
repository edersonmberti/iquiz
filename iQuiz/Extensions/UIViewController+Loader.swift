//
//  UIViewController+Loader.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 17/08/21.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
    
    func showLoader() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.center = aView!.center
        activityIndicatorView.startAnimating()
        aView?.addSubview(activityIndicatorView)
        self.view.addSubview(aView!)
    }
    
    func hideLoader() {
        aView?.removeFromSuperview()
    }
}
