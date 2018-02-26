//
//  favouriteHearts.swift
//
//  Created by Shruti Mishra on 1/13/18.
//

import UIKit

class favouriteHearts: UIView {

    var timerfavAnimation = Timer()
    var arrImage:NSArray = NSArray()
    func startAnimation(){
        arrImage = [#imageLiteral(resourceName: "ic_red"),#imageLiteral(resourceName: "ic_white"),#imageLiteral(resourceName: "ic_green"),#imageLiteral(resourceName: "ic_orange"),#imageLiteral(resourceName: "ic_mehroon"),#imageLiteral(resourceName: "ic_turquoise"),#imageLiteral(resourceName: "ic_grey"),#imageLiteral(resourceName: "ic_blue"),#imageLiteral(resourceName: "ic_light"),#imageLiteral(resourceName: "ic_brown"),#imageLiteral(resourceName: "ic_yellow"),#imageLiteral(resourceName: "ic_lightblue"),#imageLiteral(resourceName: "ic_purple"),#imageLiteral(resourceName: "ic_lightgreen"),#imageLiteral(resourceName: "ic_voilet"),#imageLiteral(resourceName: "ic_lightorange"),#imageLiteral(resourceName: "ic_pink"),#imageLiteral(resourceName: "ic_lightvoilet")]
        timerfavAnimation = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(addAnimation), userInfo: nil, repeats: true)
      
    }
    
    func stopAnimation(){
        timerfavAnimation.invalidate()
    }
    
    @objc func addAnimation(){
        
        let heartImageView = UIImageView(image: arrImage[random(9)] as? UIImage)
        heartImageView.frame = CGRect(x: self.frame.width-30, y: self.frame.height-20, width: 30, height: 30)
        self.addSubview(heartImageView)
        
        let floatingPath = UIBezierPath()
        
        let randomNumber = self.randomFloatBetweenNumbers(firstNum:50, secondNum: self.frame.size.height-20)
        
        let oX: CGFloat = heartImageView.frame.origin.x
        let oY: CGFloat = heartImageView.frame.origin.y
        let eX: CGFloat = oX
        let eY: CGFloat = oY - randomNumber
        let t: CGFloat = 60
        var cp1 = CGPoint(x: oX - t, y: (oY + eY) / 2)
        var cp2 = CGPoint(x: oX + t, y: cp1.y)
        let r: Int = Int(arc4random() % 2)
        if r == 1 {
            let temp: CGPoint = cp1
            cp1 = cp2
            cp2 = temp
        }
        
        floatingPath.move(to: CGPoint(x: oX, y: oY))
        floatingPath.addCurve(to: CGPoint(x: eX, y: eY), controlPoint1: cp1, controlPoint2: cp2)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({() -> Void in
            UIView.transition(with: heartImageView, duration: 1.0, options: .transitionCrossDissolve, animations: {() -> Void in
                heartImageView.alpha = 0
            }, completion: {(_ finished: Bool) -> Void in
                heartImageView.removeFromSuperview()
            })
        })
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.duration = 2
        pathAnimation.path = floatingPath.cgPath
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        heartImageView.layer.add(pathAnimation, forKey: "movingAnimation")
        
        CATransaction.commit()
    }
    func randomFloatBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func random(_ n:Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
}
