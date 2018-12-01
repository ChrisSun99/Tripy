//
//  LoginViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Checks if user is already signed in and skips login
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loginToMain", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func didAttemptLogin(_ sender: Any) {
        guard let emailText = emailField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        if emailText == "" || passwordText == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)}
        
        else {
        Auth.auth().signIn(withEmail: emailText, password: passwordText, completion: {
            (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "Authentication Failure", message: "Sign in failed, please try agian", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
        })
    }
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

