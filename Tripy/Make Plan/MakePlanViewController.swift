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
    @IBOutlet weak var anotherinputTextField: UITextField!
    
    @IBAction func createplan(_ sender: Any) {
        performSegue(withIdentifier: "viewplan", sender: self)
    }
    
 
        
    var datePicker: UIDatePicker?
    var anotherdatePicker: UIDatePicker?
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action:
            #selector(MakePlanViewController.dateChanged(datePicker:)),
                              for: .valueChanged)
       
        anotherdatePicker = UIDatePicker()
        anotherdatePicker?.datePickerMode = .date
        anotherdatePicker?.addTarget(self, action:
            #selector(MakePlanViewController.anotherdateChanged(anotherdatePicker:)),
                              for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MakePlanViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
        anotherinputTextField.inputView = anotherdatePicker
        
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
    
    @objc func anotherdateChanged(anotherdatePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        anotherinputTextField.text = dateFormatter.string(from:(anotherdatePicker.date)
        )
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
