//
//  DesignableUITextField.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 18/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

@IBDesignable class TextField: UITextField {
    
    @IBInspectable var leftIcon: UIImage? {
        didSet {
            if let image = leftIcon {
                leftViewMode = UITextFieldViewMode.always
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 55, height: 20))
                imageView.image = image
                imageView.contentMode = .center
                leftView = imageView
            } else {
                leftViewMode = UITextFieldViewMode.never
                leftView = nil
            }
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor = UIColor(hexValue: 0xD8D8D8) {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes:[NSForegroundColorAttributeName: placeHolderColor])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}


