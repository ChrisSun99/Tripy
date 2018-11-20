//
//  AddTripsViewController.swift
//  Tripy
//
//  Created by Chris  on 11/19/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit
import Photos

class AddTripsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    // Do any additional setup after loading the view.
    }
    @IBOutlet weak var TripTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var doneSaving: (() -> ())?
    
    
    
    @IBOutlet weak var imageView: UIButton!  //the camera icon
    
    @IBAction func addPhoto(_ sender: Any) { //choose a background picture from photo library
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.delegate = self
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                    
                case .notDetermined:
                    break
    
                    
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo library access is restricted and cannot be accessed.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "ok", style: .default)
                
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Photo library access is restricted and cannot be accessed.", preferredStyle: .alert)
                    let gotoSettingsAction = UIAlertAction(title: "Go to settings", style: .default) {(action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancalAction = UIAlertAction(title: "cancel", style: .cancel)
                    alert.addAction(gotoSettingsAction)
                    alert.addAction(cancalAction)
                }
                
            }
        }
    }

    @IBOutlet weak var Userimage: UIImageView! //the background image that user chooses
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        TripTextField.rightViewMode = .never
        guard TripTextField.text != "", let newTripName = TripTextField.text else {
            let imageView = UIImageView(frame:  CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.image = UIImage(named: "error")
            imageView.contentMode = .scaleAspectFit
            TripTextField.rightView = imageView
            TripTextField.rightViewMode = .always
            return
        }
        TripFunctions.createTrip(tripModel: TripModel(name: TripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
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



extension AddTripsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let selectedImage = info[.originalImage] as? UIImage else {
             print("Error: \(info)")
             return
        }
            self.Userimage.image = selectedImage
            self.Userimage.contentMode = .scaleAspectFill
        
        dismiss(animated:true)
    }}

