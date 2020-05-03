//
//  ViewController.swift
//  InstagramCloneIOS
//
//  Created by Okan Serdaroğlu on 3.05.2020.
//  Copyright © 2020 Okan Serdaroğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonSignUp(_ sender: Any) {
    }
    @IBAction func buttonSignIn(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
}

