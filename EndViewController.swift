//
//  EndViewController.swift
//  TapHands
//
//  Created by Apple on 20/04/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Social
import MessageUI



class EndViewController: UIViewController ,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    
    }
    

  
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var scoredData:String!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius=6.0
        label2.layer.cornerRadius=6.0
        button1.layer.cornerRadius=6.0
        button2.layer.cornerRadius=6.0
        button3.layer.cornerRadius=6.0
        button4.layer.cornerRadius=6.0
        
        scoreLabel.text=scoredData
        
        // Do any additional setup after loading the view.
    }
    
    


    @IBAction func endGame(_ sender: Any) {
        self.dismiss(animated: false, completion:nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func shareTwitter(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitter : SLComposeViewController=SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter.setInitialText("My final score was \(String(describing: scoreLabel.text))!")
            self.present(twitter, animated: true, completion:nil )
        }
        else{
            let alert=UIAlertController(title: "Accounts", message: "Please login to ypur twitter account in settings", preferredStyle:UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"ok",style:UIAlertAction.Style.default,handler:nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            
            let mail:MFMailComposeViewController=MFMailComposeViewController()
            mail.mailComposeDelegate=self
            mail.setCcRecipients(nil)
            mail.setSubject("Can you beat my score !")
            mail.setMessageBody("my score is:\(scoreLabel.text!)", isHTML: false)
            self.present(mail, animated: true, completion: nil)
        }
        else{
            let alert=UIAlertController(title: "Accunt", message: "Please login to your Email account", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"ok",style:UIAlertAction.Style.default,handler:nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareSMS(_ sender: Any) {
        if MFMessageComposeViewController.canSendText(){
            let message:MFMessageComposeViewController=MFMessageComposeViewController()
            message.messageComposeDelegate=self
            message.recipients=nil
            message.body="my final score was \(scoreLabel.text!)"
            self.present(message, animated: true, completion: nil)
    }
        else{
            let alert=UIAlertController(title: "Warning ", message: "this device cannot send message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"ok",style:UIAlertAction.Style.default,handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
        
}
    func messageComposeviewController(controller:MFMessageComposeViewController,didFinishWith result:MessageComposeResult){
        self.dismiss(animated: true, completion: nil)
    }
}

