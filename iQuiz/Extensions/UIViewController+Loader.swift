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
        
        let largeView = createView(radius: 45, color: Colors.blue.cgColor, animationDuration: 1.5)
        let mediumView = createView(radius: 30, color: Colors.orange.cgColor, animationDuration: 2)
        let smallView = createView(radius: 15, color: Colors.cyan.cgColor, animationDuration: 1)
        
        boxView.addSubview(largeView)
        boxView.addSubview(mediumView)
        boxView.addSubview(smallView)
        
        addBasicRotationAnimation(largeView, duration: 1.25)
        addBasicRotationAnimation(mediumView, duration: 1.75)
        addBasicRotationAnimation(smallView, duration: 0.75)
        
        containerView?.addSubview(boxView)
        self.view.addSubview(containerView!)
    }
    
    func hideLoader() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
    
    private func createView(radius: CGFloat, color: CGColor,animationDuration duration: Double) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        view.center = CGPoint(x: 100, y: 100)
        view.backgroundColor = UIColor.clear
        
        let circularPath = createCircularPath(radius: radius)
        let trackLayer = createTrackLayer(path: circularPath.cgPath)
        let shapeLayer = createShapeLayer(path: circularPath.cgPath, color: color)
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        
        addBasicRotationAnimation(view, duration: duration)
        
        return view
    }
    
    private func createCircularPath(radius: CGFloat) -> UIBezierPath {
        return UIBezierPath(
            arcCenter: CGPoint(x: 45, y: 45),
            radius: radius,
            startAngle: -CGFloat.pi / 2,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        )
    }
    
    private func createShapeLayer(path: CGPath, color: CGColor) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 8
        shapeLayer.strokeEnd = 0.5
        
        return shapeLayer
    }
    
    private func createTrackLayer(path: CGPath) -> CAShapeLayer {
        let trackLayer = CAShapeLayer()
        trackLayer.path = path
        trackLayer.strokeColor = Colors.textTertiary.withAlphaComponent(0.1).cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.lineWidth = 5
        
        return trackLayer
    }
    
    private func addBasicRotationAnimation(_ view: UIView, duration: Double) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = .infinity

        view.layer.add(rotateAnimation, forKey: "RotationAnimation")
    }
}
