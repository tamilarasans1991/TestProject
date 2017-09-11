//
//  UserDetails.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 30/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController{
    
    @IBOutlet weak var firsttextfiled: UITextField!
    @IBOutlet weak var fifthtextfeild: UITextField!
    @IBOutlet weak var fourthtextfield: UITextField!
    @IBOutlet weak var thirdtextfeild: UITextField!
    @IBOutlet weak var secondtextfeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Etape 3/4";
        self.setupUI()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Custom Methods
extension UserDetailsViewController {
    func setupUI() {
        firsttextfiled.layer.cornerRadius = firsttextfiled.frame.size.height / 2
        secondtextfeild.layer.cornerRadius = secondtextfeild.frame.size.height / 2
        thirdtextfeild.layer.cornerRadius = thirdtextfeild.frame.size.height / 2
        fourthtextfield.layer.cornerRadius = fourthtextfield.frame.size.height / 2
        fifthtextfeild.layer.cornerRadius = fifthtextfeild.frame.size.height / 2
    }
}
