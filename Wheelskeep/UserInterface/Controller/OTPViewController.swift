//
//  MobileOtpController.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 29/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//


import UIKit

class OTPViewController: UIViewController {
    
    @IBOutlet weak var textotpview: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
         self.navigationItem.title = "Etape 2/4";
        textotpview.layer.cornerRadius=textotpview.frame.size.height/2;
  }
    
    @IBAction func otponclick(_ sender: Any) {
        self.performSegue(withIdentifier: "usercontroller",sender: nil)

    }
}
