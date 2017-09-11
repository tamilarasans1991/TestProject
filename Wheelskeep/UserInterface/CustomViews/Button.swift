//
//  MyButton.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 09/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

@IBDesignable class Button: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var bgColor: UIColor = UIColor.white {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var textColor: UIColor = UIColor.blue {
        didSet {
            self.setTitleColor(textColor, for: .normal)
           
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
    func setupUI() {
        self.backgroundColor = bgColor
        self.setTitleColor(textColor, for: .normal)
        self.clipsToBounds = true
        self.titleLabel?.font = UIFont.init(name: "Avenir-Heavy", size: 18.0)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
}
