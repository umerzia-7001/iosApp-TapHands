//
//  GameViewController.swift
//  TapHands
//
//  Created by Apple on 19/04/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    // variables
    var tapInt=0
    var startInt=3
    var startTimer=Timer()
    var recordData:String!
    var gameInt=10
    var gameTimer=Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius=5.0
        label2.layer.cornerRadius=5.0
        button.layer.cornerRadius=5.0
        
        
        tapInt=0
        scoreLabel.text=String(tapInt) //button timer
        
        startInt=3
        timeLabel.text=String(gameInt) // game timer
        
        gameInt=10
        
        let userDefaults=Foundation.UserDefaults.standard
        let value=userDefaults.string(forKey: "Record")
        recordData=value
    
        button.setTitle(String(startInt), for: .normal)
        button.isEnabled=false
        
        startTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTimer), userInfo: nil, repeats: true)
        

    }
   
        
    @IBAction func tapMeButton(_ sender: Any) {
        tapInt+=1
        scoreLabel.text=String(tapInt)
    }
    @objc func startGameTimer(){
        startInt-=1
        button.setTitle(String(startInt), for:.normal)
        if startInt==0{
            startTimer.invalidate()
            button.setTitle(" Tap Me ", for: .normal)
             button.isEnabled=true
            gameTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.Game), userInfo: nil, repeats: true)
        }
       
    }
    
    @objc func Game(){
        gameInt-=1
        timeLabel.text=String(gameInt)
        if gameInt==0{
            gameTimer.invalidate()
            
            
            if recordData==nil{
                let savedString=scoreLabel.text
                let userDefaults=Foundation.UserDefaults.standard
                userDefaults.set(savedString,forKey: "Record")
            }
            else{
                let score:Int?=Int(scoreLabel.text!)
                let record:Int?=Int(recordData)
                if score!>record!{
                    let savedString=scoreLabel.text
                    let userDefaults=Foundation.UserDefaults.standard
                    userDefaults.set(savedString,forKey: "Record")
                }
                
            }
            
            let savedString=scoreLabel.text
            let userDefaults=Foundation.UserDefaults.standard
            userDefaults.set(savedString,forKey: "key")
            button.isEnabled=false
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
        
    }
    }
    @objc func end(){
        
        let vc=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"endGame") as! EndViewController
        
        vc.scoredData=scoreLabel.text
        self.present(vc, animated: false, completion: nil)
    
    }
    
    
}
