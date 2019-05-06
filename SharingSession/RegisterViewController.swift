//
//  RegisterViewController.swift
//  SharingSession
//
//  Created by ArifRachman on 03/05/19.
//  Copyright © 2019 ArifRachman. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var labelError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRegister.layer.cornerRadius = 20
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        if (Utility.app.isEmpty(value: fullName.text!) ||
            Utility.app.isEmpty(value: email.text!) ||
            Utility.app.isEmpty(value: phoneNumber.text!) ||
            Utility.app.isEmpty(value: password.text!) ||
            Utility.app.isEmpty(value: rePassword.text!)) {
            Utility.app.displayMessage(userMessage: "All Fields Are Required to Fill In", component: labelError!)

            Utility.app.borderRed(value: fullName)
            Utility.app.borderRed(value: email)
            Utility.app.borderRed(value: phoneNumber)
            Utility.app.borderRed(value: password)
            Utility.app.borderRed(value: rePassword)
        } else if(Utility.app.minLength(value: fullName.text!, min: 4)) {
            Utility.app.displayMessage(userMessage: "FullName Minimum 4 Characters", component: labelError!)
            Utility.app.borderRed(value: fullName)
            
            Utility.app.borderNone(value: email)
            Utility.app.borderNone(value: phoneNumber)
            Utility.app.borderNone(value: password)
            Utility.app.borderNone(value: rePassword)
        } else if (!Utility.app.isValidEmail(testStr: email.text!)){
            Utility.app.displayMessage(userMessage: "Your Email is Invalid", component: labelError!)
            Utility.app.borderRed(value: email)
            
            Utility.app.borderNone(value: fullName)
            Utility.app.borderNone(value: phoneNumber)
            Utility.app.borderNone(value: password)
            Utility.app.borderNone(value: rePassword)
        } else if (!Utility.app.isValidPhoneNum(value: phoneNumber.text!)) {
            Utility.app.displayMessage(userMessage: "Your Phone Number is Invalid", component: labelError!)
            Utility.app.borderRed(value: phoneNumber)
            
            Utility.app.borderNone(value: fullName)
            Utility.app.borderNone(value: email)
            Utility.app.borderNone(value: password)
            Utility.app.borderNone(value: rePassword)
        } else if Utility.app.minLength(value: password.text!, min: 7) {
            Utility.app.displayMessage(userMessage: "Passwsord Minimum 7 Characters", component: labelError!)
            Utility.app.borderRed(value: password)
            Utility.app.borderRed(value: rePassword)
            
            Utility.app.borderNone(value: fullName)
            Utility.app.borderNone(value: email)
            Utility.app.borderNone(value: phoneNumber)
            Utility.app.borderNone(value: rePassword)
        } else if ((Utility.app.isPasswordSame(password: password.text!, confirmPassword: rePassword.text!))) {
            Utility.app.displayMessage(userMessage: "Please Make Sure That Password Match", component: labelError!)
            Utility.app.borderRed(value: password)
            Utility.app.borderRed(value: rePassword)
            
            Utility.app.borderNone(value: fullName)
            Utility.app.borderNone(value: email)
            Utility.app.borderNone(value: phoneNumber)
        } else {
            Utility.app.hiddenMessage(hidden: true, component: labelError!)
            successMessage(fullname: fullName.text!)
            
            Utility.app.borderNone(value: fullName)
            Utility.app.borderNone(value: email)
            Utility.app.borderNone(value: phoneNumber)
            Utility.app.borderNone(value: password)
            Utility.app.borderNone(value: rePassword)
        }
        
    }
    
    @IBAction func fullNameOnChange(_ sender: UITextField) {
        Utility.app.hiddenMessage(hidden: true, component: labelError!)
        Utility.app.borderNone(value: fullName)
    }
    @IBAction func emailOnChange(_ sender: UITextField) {
        Utility.app.hiddenMessage(hidden: true, component: labelError!)
        Utility.app.borderNone(value: email)
    }
    @IBAction func phoneNumberOnChange(_ sender: UITextField) {
        Utility.app.hiddenMessage(hidden: true, component: labelError!)
        Utility.app.borderNone(value: phoneNumber)
    }
    @IBAction func passwordOnChange(_ sender: UITextField) {
        Utility.app.hiddenMessage(hidden: true, component: labelError!)
        Utility.app.borderNone(value: password)
    }
    @IBAction func rePasswordOnChange(_ sender: UITextField) {
        Utility.app.hiddenMessage(hidden: true, component: labelError!)
        Utility.app.borderNone(value: rePassword)
    }
    
    func successMessage(fullname: String)
    {
        let alert = UIAlertController(title: "Welcome \(fullname)", message: "Go To Login!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        let loginStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let idLogin = loginStoryBoard.instantiateViewController(withIdentifier: "rootMain")
        
        present(idLogin, animated: false)
    }

}
