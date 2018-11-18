import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 60, y: 120, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        
        title = "UIView Animations"
    }
    
    func planeDepart() {
        let originalCenter = demoView.center
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.demoView.center.x += 40.0
                self.demoView.center.y += 60.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3) {
                self.demoView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                self.demoView.transform = .identity
                self.demoView.center.x -= 20.0
                self.demoView.center.y -= 30.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2, animations: {
                self.demoView.center = originalCenter
                
            })
            
        }, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        planeDepart()
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav


