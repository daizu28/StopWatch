//
//  ViewController.swift
//  StopWatch
//
//  Created by 小林玲衣奈 on 2020/09/03.
//  Copyright © 2020 小林玲衣奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    @IBOutlet var moji : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        switch count{
        case (9.80 ... 10.20):
            moji.text = "PERFECT"
        case (9.70 ... 10.30):
            moji.text = "GREAT"
        case(9.50 ... 10.50):
            moji.text = "GOOD"
        default:
            moji.text = "COUNTER"
        }
    }
    
    @IBAction func start(){
        if !timer.isValid{
            //頭の!は〜でないの意味なので、タイマーが作動してなかったらタイマーを動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats : true)
            
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(count)
    }

}

