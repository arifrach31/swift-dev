//
//  Utility.swift
//  SharingSession
//
//  Created by ArifRachman on 05/05/19.
//  Copyright © 2019 ArifRachman. All rights reserved.
//

import Foundation
import UIKit

class Utility: UIViewController {
    static var app: Utility = {
        return Utility()
    }()
    
    func isValidAccount(username: String, password: String) -> Bool {
        if(username == "Demo" && password == "Demo1234") {
            return true
        } else {
            return false
        }
    }
    
    func isEmpty(value: String) -> Bool {
        if(value.isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func isValidPhoneNum(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(0))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password != confirmPassword{
            return true
        }else{
            return false
        }
    }
    
    func minLength(value: String, min: Int) -> Bool {
        if value.count < min {
            return true
        }else{
            return false
        }
    }
    
    func displayMessage(userMessage:String, component: UILabel)  {
        component.isHidden = false
        component.text = userMessage
    }
    
    func borderRed(value: UITextField) {
        value.layer.borderWidth = 1
        value.layer.borderColor = UIColor.red.cgColor
    }
    
    func borderNone(value: UITextField) {
        value.layer.borderWidth = 0
    }
    
    func hiddenMessage(hidden: Bool, component: UILabel) {
        component.isHidden = hidden
    }
}
