//: [Previous](@previous)
//: # Chapter 9: X-Axis Alpha Transition
//: Animate a fading green "Before Transition" demoLabel rectangle moving to
//: the right replaced by a clear "After Transition" secondLabel rectangle
//: moving to the left.  Reverse and repeat.
//:
//: [Help](Help)
import UIKit
import PlaygroundSupport

class MainViewController : UIViewController{
    var demoLabel : UILabel!
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blue
        title = "X-Axis Alpha Transition"
        demoLabel = UILabel(frame: CGRect(x: 25, y: 120, width: 180, height: 60))
        demoLabel.backgroundColor = UIColor.green
        demoLabel.text = "Before Transition"
        demoLabel.textAlignment = .center
        demoLabel.layer.cornerRadius = 12
        demoLabel.layer.masksToBounds = true
        self.view.addSubview(demoLabel)
    }
    override func viewDidAppear(_ animated: Bool) {
        let offsetDeparting = CGPoint(
            x: CGFloat(150),
            y: 0.0)
        XAxisTransition(label: demoLabel, text: "After Transition",
                        offset: offsetDeparting)
    }
    func XAxisTransition(label: UILabel, text: String, offset: CGPoint) {
        let secondLabel = UILabel(frame: label.frame)
        secondLabel.text = text
        secondLabel.font = label.font
        secondLabel.textAlignment = label.textAlignment
        secondLabel.textColor = label.textColor
        secondLabel.backgroundColor = .clear
        secondLabel.transform = CGAffineTransform(translationX: offset.x, y:
            offset.y)
        secondLabel.alpha = 0
        view.addSubview(secondLabel)
        UIView.animate(withDuration: 2.5, delay: 0.0,
                       options: [.repeat, .autoreverse, .curveEaseInOut],
                       animations: {
                        label.transform = CGAffineTransform(translationX: offset.x, y:
                            offset.y)
                        label.alpha = 0.0
        },
                       completion: nil
        )
        UIView.animate(withDuration: 2.5, delay: 0.0, options: [.repeat, .autoreverse, .curveEaseInOut],
                       animations: {
                        secondLabel.transform = .identity
                        secondLabel.alpha = 1.0
        },
                       completion: nil
        )
    }
    func simpleLabelTextTransition() {
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
//: [Next](@next)
