//
//  StartPageViewController.swift
//  Tripy
//
//  Created by Chris  on 11/25/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController {
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBAction func Go(_ sender: Any) {
        performSegue(withIdentifier: "gotologinpage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.alpha = 0
        titleLabel.alpha = 0
        descLabel.alpha = 0
        goButton.alpha = 0
        findLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 0.6
        }) {(true)in
            self.showTitle()
        }
    }
    
    func showTitle(){
        UIView.animate(withDuration: 1, animations: {
            self.titleLabel.alpha = 1
        }, completion:{ (true) in
            self.showDesciption()
        })
    }
    
    func showDesciption(){
        UIView.animate(withDuration: 1, animations: {
            self.descLabel.alpha = 1
        }) {(true) in
            self.showButtonAndText()
            
        }
    }
    
    func showButtonAndText(){
        UIView.animate(withDuration: 1, animations: {
            self.goButton.alpha = 1
            self.findLabel.alpha = 1
        })
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
