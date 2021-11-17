//
//  WelcomeViewController.swift
//  TinDog
//
//  Created by Ramiro Soto on 11/17/21.
//

import UIKit
import AudioToolbox
import ProgressHUD

class WelcomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // overrideUserInterfaceStyle = .dark
        setupBackgroundTouch()

    }
    //MARK: - IBActions
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        if emailTextField.text != "" {
            //reset password
            
        }
        else{
            //show error
            ProgressHUD.showError("Please insert your email address.")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            //login
            
        }
        else{
            //show error
            ProgressHUD.showError("All fields are required!")
        }
    }
    
    //MARK: - Setup
    
    private func setupBackgroundTouch(){
        backgroundImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        backgroundImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap(){
        dismissKeyboard()
    }
    
    //MARK: - Helpers
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
}
