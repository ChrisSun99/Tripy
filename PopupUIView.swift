//
//  PopupUIView.swift
//  Tripy
//
//  Created by Chris  on 11/19/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 15
    }
    

}
