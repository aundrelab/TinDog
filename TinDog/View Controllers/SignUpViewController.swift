//
//  SignUpViewController.swift
//  TinDog
//
//  Created by Prince Rios on 11/3/21.
//

import Foundation

func validateFields() -> String? {
    //check that all fields are filled in
    if nameTextField.text?.trimmingCharacters(in: whitespacesAndNewlines) == "" ||
        usernameTextField.text?.trimmingCharacters(in: whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: whitespacesAndNewlines) == "" {
        
        return "Please fill in all fields"
    }
    
    //check if password is secure
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in:
        .whitespacesAndNewlines)
    
    if Utilities.isPasswordValid(password: cleanedPassword) == false {
        return "Please make sure your password is at least 8 characters, contains a special character and a number."
    }
    
    return nil
}
