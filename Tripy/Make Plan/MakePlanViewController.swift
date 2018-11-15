//
//  MakePlanViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit

class MakePlanViewController: UIViewController {

    @IBOutlet weak var planname: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    private var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action:
            #selector(MakePlanViewController.dateChanged(datePicker:)),
                              for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MakePlanViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createplans(_ sender: Any) {
        performSegue(withIdentifier: "displayplans", sender: self)
    }
    
    @IBAction func cancel(_ sender: Any) {
        performSegue(withIdentifier: "toexistedplans", sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputTextField.text = dateFormatter.string(from:datePicker.date)
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
