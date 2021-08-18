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
        
        let largeCircularPath = createCircularPath(radius: 50)
        let largeShapeLayer = createShapeLayer(path: largeCircularPath.cgPath, color: Colors.blue.cgColor)
        let largeTrackLayer = createTrackLayer(path: largeCircularPath.cgPath)
        
        let mediumCircularPath = createCircularPath(radius: 35)
        let mediumShapeLayer = createShapeLayer(path: mediumCircularPath.cgPath, color: Colors.orange.cgColor)
        let mediumTrackLayer = createTrackLayer(path: mediumCircularPath.cgPath)
        
        let smallCircularPath = createCircularPath(radius: 20)
        let smallShapeLayer = createShapeLayer(path: smallCircularPath.cgPath, color: Colors.cyan.cgColor)
        let smallTrackLayer = createTrackLayer(path: smallCircularPath.cgPath)
        
        boxView.layer.addSublayer(largeTrackLayer)
        boxView.layer.addSublayer(largeShapeLayer)
        
        boxView.layer.addSublayer(mediumTrackLayer)
        boxView.layer.addSublayer(mediumShapeLayer)
        
        boxView.layer.addSublayer(smallTrackLayer)
        boxView.layer.addSublayer(smallShapeLayer)
        
        containerView?.addSubview(boxView)
        self.view.addSubview(containerView!)
        
        addBasicAnimation(shape: largeShapeLayer, duration: 1.5)
        addBasicAnimation(shape: mediumShapeLayer, duration: 1.6)
        addBasicAnimation(shape: smallShapeLayer, duration: 1.7)
    }
    
    func hideLoader() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
    
    private func createCircularPath(radius: CGFloat) -> UIBezierPath {
        return UIBezierPath(
            arcCenter: CGPoint(x: 100, y: 100),
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
        shapeLayer.strokeEnd = 0
        
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
    
    private func addBasicAnimation(shape: CAShapeLayer, duration: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = duration
        basicAnimation.repeatCount = .infinity
        basicAnimation.autoreverses = true
        
        shape.add(basicAnimation, forKey: "LoaderAnimation")
    }
}
