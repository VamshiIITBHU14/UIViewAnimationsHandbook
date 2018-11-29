//: [Previous](@previous)
//: # Chapter 7: Curl Up and Dissolve
//: Start the demo to reveal a green demoView rectangle via a transition.
//: Tap the green demoView rectangle to make it dissolve into the gray
//: background.
//:
//: [Help](Help)
import UIKit
import PlaygroundSupport

class MainViewController : UIViewController{
    var animationContainerView : UIView!
    var demoView : UIView!
    override func viewDidLoad() {
        view.backgroundColor = UIColor.yellow
        animationContainerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        animationContainerView.backgroundColor = UIColor.darkGray
        self.view.addSubview(animationContainerView)
        title = "Curl Up and Dissolve"
    }
    override func viewDidAppear(_ animated: Bool) {
        demoView = UIView(frame: CGRect(x: view.center.x-40, y: view.center.y-20, width: 80, height: 40))
        demoView.backgroundColor = UIColor.green
        demoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(demoViewTapped)))
        //add a subview via transition
        UIView.transition(with: animationContainerView, duration: 2.0, options: [.curveEaseIn, .transitionCurlUp], animations: {
            self.animationContainerView.addSubview(self.demoView)
        }, completion: nil)
    }
    @objc func demoViewTapped() {
        //replace views via transition
        //        UIView.transition(from: animationContainerView, to: demoView, duration: 0.33,
        //                          options: .transitionFlipFromTop, completion: nil)
        //hide/ remove a subview via transition
        UIView.transition(with: animationContainerView,
                          duration: 4.0,
                          options: [.curveEaseOut, .transitionCrossDissolve],
                          animations: {
                            self.demoView.removeFromSuperview()
                            //self.demoView.isHidden = true
        }, completion: nil)
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav
//: [Next](@next)
