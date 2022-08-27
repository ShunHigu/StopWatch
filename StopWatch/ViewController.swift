//
//  ViewController.swift
//  StopWatch
//
//  Created by 日暮駿之介 on 2022/08/25.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!
    
    var count: Float=0.0
    
    var timer: Timer=Timer()

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    @objc func up(){
        //countwo0.01たす
        count=count+0.01
        //ラベルに小数点２桁まで表示
        label.text=String(format:"%.2f",count)
    }
    
    @objc func hantei(){
        if count>=9.80&&count<=10.20{
            label2.text=String("PERFECT")
        }
        else if count>=9.70&&count<=10.30{
            label2.text=String("GREAT")
        }
        else if count>=9.50&&count<=10.5{
            label2.text=String("GOOD")
        }
        else{
            label2.text=String("BAD")
        }
        
    }

    @IBAction func start(){
        
        if !timer.isValid{
            //タイマーが動作していなかったら動かす
            timer=Timer.scheduledTimer(timeInterval: 0.01,
                                       target: self,
                                       selector:#selector(self.up),
                                       userInfo: nil,
                                       repeats: true
            )
        }
        
    }
    
    
    
    @IBAction func stop(){
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
        if !timer.isValid{
            //タイマーが泊まっていたらshokikasuru
            count=0.0
            label.text=String(format:"%.2f",count)
        }
    }
}

