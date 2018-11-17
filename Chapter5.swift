import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 120, y: 60, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        
        title = "UIView Animations"
    }
    override func viewWillAppear(_ animated: Bool) {
        demoView.center.y = 60
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5, delay: 0.5,
                       usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [],
                       animations: {
                        self.demoView.center.y = 150.0
        }, completion: nil)
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

