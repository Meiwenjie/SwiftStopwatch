//
//  ViewController.swift
//  SwiftStopwatch
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 MWJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Counter = 0.0
    var Timer = NSTimer()
    var Isplaying = false
    var timeLabel = UILabel()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        timeLabel = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,300))
        timeLabel.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width,300)
        timeLabel.backgroundColor = UIColor.blackColor()
        timeLabel.font = UIFont.systemFontOfSize(100)
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.text = String("0.0")
        timeLabel.textAlignment = .Center
        self.view.addSubview(timeLabel)
        
        let resetBut = UIButton(frame: CGRectMake(UIScreen.mainScreen().bounds.width - 80,20,80,50))
        resetBut.setTitle("Reset", forState: UIControlState.Normal)
        resetBut.addTarget(self, action: "resetClick:", forControlEvents: UIControlEvents.TouchUpInside)
        resetBut.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view .addSubview(resetBut)
        
        
        let leftBut = UIButton(frame: CGRectMake(0,300,UIScreen.mainScreen().bounds.width/2,UIScreen.mainScreen().bounds.height-300))
        leftBut.backgroundColor = UIColor(red:0.3, green: 0.5, blue: 0.6, alpha: 1.0)
        leftBut.setImage(UIImage(named: "play"),forState:UIControlState.Normal)
        leftBut.addTarget(self, action: "leftclick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(leftBut)
        
        let rightBut = UIButton(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2,300,UIScreen.mainScreen().bounds.width/2,UIScreen.mainScreen().bounds.height-300))
        rightBut.backgroundColor = UIColor(red: 0.1, green: 0.7, blue: 0.2, alpha: 1.0)
        rightBut.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        rightBut.addTarget(self, action: "rightclick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(rightBut)
        
    }
    func resetClick(sender: UIButton){
        NSLog("resetClick")
        Timer.invalidate()
        Isplaying = false
        Counter = 0
        timeLabel.text = String(Counter)
    }
    func leftclick(sender: UIButton){
        NSLog("leftclick")
        if(Isplaying){
            return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        Isplaying = true

    }
    func rightclick(sender: UIButton){
        NSLog("rightclick")
        Timer.invalidate()
        Isplaying = false
    }
    func update(){
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f",Counter)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

