//
//  NavigationController.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 18/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

class NavigationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func profilebtnClick(_ sender: Any) {
        
        self.performSegue(withIdentifier: "navigation", sender: nil)
    }
    
    
}
