//
//  ProfileController.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 18/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

class RegistrationTutorialViewController: UIViewController,UIScrollViewDelegate {
    
   
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var signupbutton: Mybutton!
    @IBOutlet weak var pagecontroll: UIPageControl!
   
    
    
        
      override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.title = "Mon profil";
         signupbutton.layer.shadowColor = UIColor.black.cgColor
         signupbutton.layer.shadowOpacity = 0.5
         signupbutton.layer.shadowOffset = CGSize(width: 2, height: 2)
       
        var imageArray :[UIImage] = [#imageLiteral(resourceName: "profiledemo2"),#imageLiteral(resourceName: "profile demo 3"),#imageLiteral(resourceName: "profile demo 4")]
          for i in 0..<imageArray.count{
            	
             let imageView = UIImageView()
             imageView.image=imageArray[i]
           
             //let xPosition = self.pageViewcontroll.currentPage
             let xPosition = self.view.frame.width * CGFloat(i)
             imageView.frame = CGRect(x: xPosition,y: 0, width: 200, height: 200)
            
            
            
            //imageView.image = imageArray[pageViewcontroll.currentPage]
            
        }
            }
    
    
    @IBAction func profileClick(_ sender: Any)
    {
        self.performSegue(withIdentifier: "profileController",sender: nil)
        
        
    }
    func textViewShouldBeginEditing(_ loginTextview: UITextView) -> Bool {
        // Do something
         self.performSegue(withIdentifier: "loginView",sender: nil)
        return false
    }

}



