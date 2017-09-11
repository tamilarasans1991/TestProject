//
//  Label.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 08/09/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

@IBDesignable class Label: UILabel
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
