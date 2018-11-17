import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 120, y: 60, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        demoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(demoViewTapped)))
        title = "UIView Animations"
    }
    override func viewWillAppear(_ animated: Bool) {
        demoView.center.y = 80
    }
    
    @objc func demoViewTapped(){
        UIView.animate(withDuration: 2.5, delay: 0.0, usingSpringWithDamping:
            0.2, initialSpringVelocity: 0.2, options: [], animations: {
                self.demoView.bounds.size.width += 80.0
                self.demoView.backgroundColor =
                    UIColor(red: 0.45, green: 0.23, blue: 0.67, alpha: 1.0)
        }, completion:nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

