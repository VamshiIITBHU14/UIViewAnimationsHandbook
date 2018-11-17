import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 0, y: 60, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        
        title = "UIView Animations"
    }
    override func viewWillAppear(_ animated: Bool) {
        demoView.center.x = -self.view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Repeat
        
        //        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: {
        //             self.demoView.center.x += 1.5*self.view.bounds.width
        //        }, completion: nil)
        
        //RepeatAndAutoReverse
        
        //        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat ,.autoreverse], animations: {
        //            self.demoView.center.x += 1.5*self.view.bounds.width
        //        }, completion: nil)
        
        //Repeat And AutoReverse And Ease options
        
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.repeat, .autoreverse, .curveEaseIn], animations: {
            self.demoView.center.x += 1.5*self.view.bounds.width
        }, completion: nil)
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav
