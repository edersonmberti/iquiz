//
//  CustomSpinner.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 18/08/21.
//

import UIKit

class CustomSpinner: UIView {

    init() {
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let largeView = createView(radius: 45, color: Colors.blue.cgColor, animationDuration: 1.5)
        let mediumView = createView(radius: 30, color: Colors.orange.cgColor, animationDuration: 2)
        let smallView = createView(radius: 15, color: Colors.cyan.cgColor, animationDuration: 1)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        container.addSubview(largeView)
        container.addSubview(mediumView)
        container.addSubview(smallView)
        self.addSubview(container)
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
        UIBezierPath(
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
