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


