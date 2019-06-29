//
//  LoginViewController.swift
//  QuikeWhats
//
//  Created by Eng.lolla on 5/14/19.
//  Copyright © 2019 Eng.lolla. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailLogIn: UITextField!
    @IBOutlet weak var passLogIn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ClickLogin(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailLogIn.text!, password: passLogIn.text!) { (user, error) in
            if  error != nil
            { print(error!)}
            else{
                self.performSegue(withIdentifier: "LogInToTableChat", sender: self)
            }

        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
}
