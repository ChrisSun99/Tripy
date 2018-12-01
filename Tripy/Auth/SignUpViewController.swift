//
//  SignUpViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Modified by Howon Kim on 11/26/18
//
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        passwordVerificationField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var passwordVerificationField: UITextField!
    
    var userName = ""
    var userEmail = ""
    var userPassword = ""
    var userVerifiedPassword = ""
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailField {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else if textField == self.passwordField {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        } else if textField == self.nameField {
            if textField.text != nil {
                self.userName = textField.text!
            }
        } else if textField == self.passwordVerificationField {
            if textField.text != nil {
                self.userVerifiedPassword = textField.text!
            }
        }
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        guard let verifiedPassword = passwordVerificationField.text else {return}
        //guard let profileimage = profileimage.image else {return}
        
        if email == "" || password == "" || name == "" || verifiedPassword == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // TO DO:
                // The user account has been successfully created. Now, update the user's name in
                // firebase and then perform a segue to the main page. Note, again, that this segue
                // already exists somewhere, just do some simple debugging to find the identifier.
                // Also, notify the user that the account has been successfully created before
                // performing the segue.
                
                if error == nil {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.userName
                    changeRequest?.commitChanges(completion:  { error in
                        if let error = error {
                            print("Error: \(error)")
                        } else {
                             self.performSegue(withIdentifier: "toTripList", sender: self)
                        }
                    })
                    
                    
                    
                } else if password != verifiedPassword {
                    let alertController = UIAlertController(title: "Verification Error.", message: "The two passwords do not match.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.passwordVerificationField.textColor = UIColor.red
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        performSegue(withIdentifier: "toTripList", sender: self)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = profileimage.image!.jpegData(compressionQuality:0.75) else { return }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                
                storageRef.downloadURL { url, error in
                    
                    completion(url)
                    // success!
                }
            } else {
                // failed
                completion(nil)
            }
        }
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

