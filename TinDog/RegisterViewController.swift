//
//  RegisterViewController.swift
//  TinDog
//
//  Created by Ramiro Soto on 11/17/21.
//

import UIKit
import ProgressHUD

class RegisterViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - Vars
    var isMale = true
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //overrideUserInterfaceStyle = .dark
        setupBackgroundTouch()

    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func registerButtonPressed(_ sender: Any) {
        if isTextDataInputed(){
            //register user
            registerUser()
        }
        else{
            //show error
            ProgressHUD.showError("All fields are required!")
        }
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func genderSegmentValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            isMale = true
        }
        else{
            isMale = false
        }
        print(isMale)
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
    
    private func isTextDataInputed() -> Bool {
        
        return usernameTextField.text != "" && emailTextField.text != "" &&
        cityTextField.text != "" && dateOfBirthTextField.text != "" &&
        passwordTextField.text != "" && confirmPasswordTextField.text != ""
    }
    
    //MARK: - RegisterUser
    private func registerUser(){
        
    }
}