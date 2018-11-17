
import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 120, y: 60, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        demoView.alpha = 0
        title = "UIView Animations"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, delay: 0.5, options: [.repeat], animations: {
            self.demoView.alpha = 1
        }, completion: nil)
        
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

