//: [Previous](@previous)
//: # Chapter 8: Y-Axis Transform Transition
//: Animate replacement of a green "Before Transition" rounded
//: rectangle with a green "After Transition" rounded rectangle.
//: The animation is accomplished by shrinking the original
//: "Before Transition" rectangle while growing the new
//: "After Transition" rectangle along the y-axis via an affine
//: transform.
//:
//: [Help](Help)
import UIKit
import PlaygroundSupport

class MainViewController : UIViewController{
    var demoLabel : UILabel!
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blue
        title = "Y-Axis Transform Transition"
        demoLabel = UILabel(frame: CGRect(x: 50, y: 120, width: 180, height: 60))
        demoLabel.backgroundColor = UIColor.green
        demoLabel.text = "Before Transition"
        demoLabel.textAlignment = .center
        demoLabel.layer.cornerRadius = 12
        demoLabel.layer.masksToBounds = true
        self.view.addSubview(demoLabel)
    }
    override func viewDidAppear(_ animated: Bool) {
        YAxisTransition(label: demoLabel, text: "After Transition")
    }
    func YAxisTransition(label: UILabel, text: String) {
        let tempLabel = UILabel(frame: label.frame)
        tempLabel.text = text
        tempLabel.font = label.font
        tempLabel.layer.cornerRadius = label.layer.cornerRadius
        tempLabel.layer.masksToBounds = true
        tempLabel.textAlignment = label.textAlignment
        tempLabel.textColor = label.textColor
        tempLabel.backgroundColor = label.backgroundColor
        let tempLabelOffset =
            label.frame.size.height/2.0
        tempLabel.transform =
            CGAffineTransform(translationX: 0.0, y: tempLabelOffset)
                .scaledBy(x: 1.0, y: 0.1)
        label.superview?.addSubview(tempLabel)
        UIView.animate(withDuration: 2.5, delay: 0, options: .curveLinear, animations: {
            tempLabel.transform = .identity
            label.transform =
                CGAffineTransform(translationX: 0.0, y: tempLabelOffset)
                    .scaledBy(x: 1.0, y: 0.1)
        }) { _ in
            label.text = tempLabel.text
            label.transform = .identity
            tempLabel.removeFromSuperview()
        }
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
