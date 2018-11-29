//: [Previous](@previous)
//: # Chapter 2: Sequence Animation
//: Sequence two animations.
//: * Animate a green rectangle entering from the right, then
//: * Animate a gray rectangle entering from the right.
//:
//: [Help](Help)
import UIKit
import PlaygroundSupport

class MainViewController : UIViewController {
    var demoView1 = UIView(frame: CGRect(x: 0, y: 60, width: 120, height: 40))
    var demoView2 = UIView(frame: CGRect(x: 0, y: 120, width: 120, height: 40))
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView1.backgroundColor = UIColor.green
        demoView2.backgroundColor = UIColor.gray
        self.view.addSubview(demoView1)
        self.view.addSubview(demoView2)
        title = "Sequence Animation"
    }
    override func viewWillAppear(_ animated: Bool) {
        demoView1.center.x = -self.view.bounds.width
        demoView2.center.x = -self.view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.demoView1.center.x += 1.5*self.view.bounds.width
        }
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: {
            self.demoView2.center.x += 1.5*self.view.bounds.width
        }, completion: nil)
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav
//: [Next](@next)
