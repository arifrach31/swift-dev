//
//  ViewController.swift
//  SharingSession
//
//  Created by ArifRachman on 01/03/19.
//  Copyright © 2019 ArifRachman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textError: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!

    
    @IBOutlet weak var buttonRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonLogin.layer.cornerRadius = 20
        buttonRegister.layer.cornerRadius = 20
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if(Utility.app.isEmpty(value: username.text!) || Utility.app.isEmpty(value: password.text!)) {
            Utility.app.displayMessage(userMessage: "All Fields Are Required to Fill In", component: textError!)
            Utility.app.borderRed(value: username)
            Utility.app.borderRed(value: password)
        } else {
            if(Utility.app.isValidAccount(username: username.text!, password: password.text!)) {
                    Utility.app.hiddenMessage(hidden: true, component: textError!)
                    Utility.app.borderNone(value: username)
                    Utility.app.borderNone(value: password)
                
                    let homeStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let idHome = homeStoryboard.instantiateViewController(withIdentifier: "idHome")
                
                    present(idHome, animated: false)
            } else {
                Utility.app.displayMessage(userMessage: "Sorry Your Account is Not Registered", component: textError!)
                Utility.app.borderRed(value: username)
                Utility.app.borderRed(value: password)
            }
            
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let registerStoryBoard = UIStoryboard.init(name: "Register", bundle: nil)
        let idRegister = registerStoryBoard.instantiateViewController(withIdentifier: "idRegister")
        
        present(idRegister, animated: false)
    }
    
}

