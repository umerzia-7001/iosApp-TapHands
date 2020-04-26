//
//  ViewController.swift
//  TapHands
//
//  Created by Apple on 18/04/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit



class ViewController: UIViewController{

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        label1.layer.cornerRadius=5.0
        button.layer.cornerRadius=5.0
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults=Foundation.UserDefaults.standard
        let value=userDefaults.string(forKey:"Record")
        if(value==nil){
            label2.text="0"
        }
        else{
        label2.text=value
        }
    }
   


}

