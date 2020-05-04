//
//  ViewController.swift
//  InstagramCloneIOS
//
//  Created by Okan Serdaroğlu on 3.05.2020.
//  Copyright © 2020 Okan Serdaroğlu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonSignUp(_ sender: Any) {
         if textFieldUserName.text != "" && textFieldPassword.text != ""{
                   Auth.auth().createUser(withEmail: textFieldUserName.text!, password: textFieldPassword.text!) { (authData, error) in
                       
                       if error != nil {
                           self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
                       } else {
                           self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                       }
                   
                   }
               } else {
                  makeAlert(title: "Error!", message: "Username/Password")
               }
    }
    
    @IBAction func buttonSignIn(_ sender: Any) {
        
       
        
    }
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                   let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                   alert.addAction(okButton)
                   self.present(alert,animated: true,completion: nil)
    }
    
}

