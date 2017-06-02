//
//  ViewController.swift
//  Takarabako
//
//  Created by Yuhao on 2017/06/01.
//  Copyright © 2017年 Yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var swipeLeft: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var hideView: UIView!
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.mainView.addGestureRecognizer(swipeLeft)
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.mainView.addGestureRecognizer(swipeRight)
        
        self.hideView.center.x = -self.hideView.bounds.width/2
        self.mainView.center.x = self.view.bounds.width/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func swipe(_ recognizer: UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.left {
            UIView.animate(withDuration:0.5, animations: {
                if self.flag%2 != 0 {
                    self.mainView.center.x = self.view.bounds.width/2
                }
            })
            UIView.animate(withDuration:0.5, animations: {
                if self.flag%2 != 0 {
                    self.hideView.center.x =  -self.hideView.bounds.width/2
                    self.flag += 1
                }
            })
            
        }else if recognizer.direction == UISwipeGestureRecognizerDirection.right {
            UIView.animate(withDuration:0.5, animations: {
                if self.flag%2 == 0 {
                    self.mainView.center.x = self.mainView.center.x + self.hideView.bounds.width
                    self.flag += 1
                }
            })
//            UIView.animate(withDuration:0.5, animations: {
//                if self.flag%2 == 0 {
//                    self.hideView.center.x = self.hideView.center.x
//                    self.flag += 1
//                }
//                
//            })
        }
    }
    
    @IBAction func openHiddenView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration:0.5, animations: {
            if self.flag%2 == 0 {
                self.mainView.center.x = self.mainView.center.x + self.hideView.bounds.width
            }else{
                self.mainView.center.x = self.view.bounds.width/2
            }
        })
        UIView.animate(withDuration:0.5, animations: {
            if self.flag%2 == 0 {
                //self.hideView.center.x = self.hideView.bounds.width/2
            }else{
                self.hideView.center.x = -self.hideView.bounds.width/2
            }
            self.flag += 1
        })
    }
    
    @IBAction func forwardChatView(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chatController = storyboard.instantiateViewController(withIdentifier: "ChatControllerSBID")
        self.present(chatController, animated: true, completion: nil)
    }
}

