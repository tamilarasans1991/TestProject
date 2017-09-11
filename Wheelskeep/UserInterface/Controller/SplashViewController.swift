//
//  SplashscreenViewController.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 11/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var animationImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//creating the animation splashscreen
        self.view.bringSubview(toFront: animationImageView)
        animationImageView.animationImages = [UIImage(named: "animation0001.png")!, UIImage(named: "animation0002.png")!, UIImage(named: "animation0003.png")!]
        animationImageView.animationDuration = 0.5
        animationImageView.animationRepeatCount = 0
        animationImageView.startAnimating()
       perform(#selector(showNavController), with: self, afterDelay: 3)
    }
    func showNavController(){
        
        animationImageView.stopAnimating()
        performSegue(withIdentifier: "splashscreenViewController", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     
     
    }
    */

}
