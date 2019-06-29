//
//  RegisterViewController.swift
//  QuikeWhats
//
//  Created by Eng.lolla on 5/14/19.
//  Copyright © 2019 Eng.lolla. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    @IBOutlet weak var userRegsiter: UITextField!
    @IBOutlet weak var emailRegister: UITextField!
    @IBOutlet weak var passRegister: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickRegister(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailRegister.text!, password: passRegister.text!) { (user, error) in
            if error != nil
            {
                print(error!)
            }
            else{
                self.performSegue(withIdentifier: "RegisterToTableChat", sender: self)
            }
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
