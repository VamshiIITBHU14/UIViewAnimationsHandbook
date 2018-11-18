# UIViewAnimationsHandbook

**HOW TO USE:**

Just pick up the chapter you want and copy paste the code in Xcode playground and run the program. Make sure the **Assistant Editor (Live View)** is turned on. Please refer to the screenshot below.

<img width="1432" alt="screen shot 2018-11-17 at 10 22 44 pm" src="https://user-images.githubusercontent.com/21070922/48663530-a7354100-eab7-11e8-84ff-768b16f3ba4e.png">


**CHAPTER 1:**

```swift
import UIKit
import PlaygroundSupport


class MaiusenViewController : UIViewController{
    var demoView = UIView(frame: CGRect(x: 0, y: 60, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView.backgroundColor = UIColor.green
        self.view.addSubview(demoView)
        
        title = "UIView Animations"
    }
    override func viewWillAppear(_ animated: Bool) {
        demoView.center.x = -self.view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.demoView.center.x += 1.5*self.view.bounds.width
            
        }
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

```

**RESULT:**

![a1](https://user-images.githubusercontent.com/21070922/48663479-ea42e480-eab6-11e8-8f2d-f82195394530.gif)


**CHAPTER 2:**

```swift
import UIKit
import PlaygroundSupport


class MainViewController : UIViewController{
    var demoView1 = UIView(frame: CGRect(x: 0, y: 60, width: 120, height: 40))
    var demoView2 = UIView(frame: CGRect(x: 0, y: 120, width: 120, height: 40))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        demoView1.backgroundColor = UIColor.green
        demoView2.backgroundColor = UIColor.gray
        self.view.addSubview(demoView1)
        self.view.addSubview(demoView2)
        
        title = "UIView Animations"
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
```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48663792-2d9f5200-eabb-11e8-82d1-8480475fec42.gif)

**CHAPTER 3:**

```swift

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
        UIView.animate(withDuration: 3.0, delay: 0.5, options: [.repeat], animations: {
            self.demoView.alpha = 1
        }, completion: nil)
        
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav

```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48663946-76580a80-eabd-11e8-97a7-b17b09d14689.gif)


**CHAPTER 4:**

```swift

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

```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48664452-ace55380-eac4-11e8-98cb-541c45556527.gif)


**CHAPTER 5:**

```swift
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

```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48664497-47459700-eac5-11e8-8070-c6c2faf06a44.gif)


**CHAPTER6:**

```swift
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

```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48664536-eec2c980-eac5-11e8-8df8-cd20ea6cd86f.gif)

**CHAPTER 7:**

```swift
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
        
        title = "UIView Animations"
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
    
    @objc func demoViewTapped(){
        //replace views via transition
        
//        UIView.transition(from: animationContainerView, to: demoView, duration: 0.33,
//                          options: .transitionFlipFromTop, completion: nil)
        
        //hide/ remove a subview via transition
        
        UIView.transition(with: animationContainerView, duration: 4.0,
                          options: [.curveEaseOut, .transitionCrossDissolve],
                          animations: {
                            self.demoView.removeFromSuperview()
                            //self.demoView.isHidden = true
        },
                          completion: nil
        )
    }
}

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)

PlaygroundPage.current.liveView = nav

```

**RESULT:**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48664570-90e2b180-eac6-11e8-8b85-6814dff8022d.gif)

**CHAPTER 8:**

```swift
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

```
**RESULT::**

![ezgif com-resize](https://user-images.githubusercontent.com/21070922/48673035-4105f800-eb63-11e8-87dd-5bacdedf2e51.gif)

**CHAPTER 9:**

```swift

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

```

**RESULT:**

