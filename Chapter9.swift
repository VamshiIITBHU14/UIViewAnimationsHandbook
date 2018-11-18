import UIKit
import PlaygroundSupport

class MainViewController : UIViewController{
    
    var demoLabel : UILabel!
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blue
        title = "UIView Animations"
        
        demoLabel = UILabel(frame: CGRect(x: 50, y: 120, width: 180, height: 60))
        demoLabel.backgroundColor = UIColor.green
        demoLabel.text = "Before Transition"
        demoLabel.textAlignment = .center
        demoLabel.layer.cornerRadius = 12
        demoLabel.layer.masksToBounds = true
        self.view.addSubview(demoLabel)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let offsetDeparting = CGPoint(
            x: CGFloat(15),
            y: 0.0)
        XAxisTransition(label: demoLabel, text: "After Transition",
                        offset: offsetDeparting)
    }
    
    func XAxisTransition(label: UILabel, text: String, offset: CGPoint) {
        let tempLabel = UILabel(frame: label.frame)
        tempLabel.text = text
        tempLabel.font = label.font
        tempLabel.textAlignment = label.textAlignment
        tempLabel.textColor = label.textColor
        tempLabel.backgroundColor = .clear
        tempLabel.transform = CGAffineTransform(translationX: offset.x, y:
            offset.y)
        tempLabel.alpha = 0
        view.addSubview(tempLabel)
        
        UIView.animate(withDuration: 2.5, delay: 0.0,
                       options: .curveEaseIn,
                       animations: {
                        label.transform = CGAffineTransform(translationX: offset.x, y:
                            offset.y)
                        label.alpha = 0.0
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 2.5, delay: 0.0, options: .curveEaseIn,
                       animations: {
                        tempLabel.transform = .identity
                        tempLabel.alpha = 1.0
        },
                       completion: {_ in
                        tempLabel.removeFromSuperview()
                        label.text = text
                        label.alpha = 1.0
                        label.transform = .identity
        } )
    }
    
    func simpleLabelTextTransition(){
        UIView.transition(with: demoLabel, duration: 2.0,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.demoLabel.text = "After Transition"
        },
                          completion: nil
        )
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

