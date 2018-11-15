//
//  SignUpViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didAttemptSignUp(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            (user, error) in
            if let error = error {
                let alert = UIAlertController(title: "Unable to Create User", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                let changeRequest = user!.user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: {
                    (err) in
                    if let err = err {
                        print(err)
                    } else {
                        self.performSegue(withIdentifier: "signupToMain", sender: nil)
                    }
                })
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
