//
//  RegisterViewController.swift
//  NewTinDog
//
//  Created by Ramiro Soto on 12/8/21.
//

import UIKit
import ProgressHUD

class RegisterViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - Vars
    var isMale = true
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundTouch()

    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if isTextDataInputed(){
            //register user
            if passwordTextField.text! == confirmPasswordTextField.text! {
                registerUser()
            } else {
                ProgressHUD.showError("Passwords don't match")
            }
            
        } else{
            ProgressHUD.showError("All fields are required!")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func genderSegmentValueChange(_ sender: UISegmentedControl) {
        isMale = sender.selectedSegmentIndex == 0
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
    @objc func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func isTextDataInputed() -> Bool {
        return usernameTextField.text != "" && emailTextField.text != "" && cityTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != ""
    }
    
    //MARK: - RegisterUser
    private func registerUser(){
        
        ProgressHUD.show()
        
        FUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!, userName: usernameTextField.text!, city: cityTextField.text!, isMale: isMale, dateOfBirth: datePicker.date, completion: {
            error in
            
            if error == nil {
                ProgressHUD.showSuccess("Verification email sent!")
                self.dismiss(animated: true, completion: nil)
            } else {
                ProgressHUD.showError(error!.localizedDescription)
            }
            
        })
    }

}

