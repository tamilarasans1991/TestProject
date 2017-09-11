//
//  TelephoneViewcontroller.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 15/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var teltextfield: UITextField!
    @IBOutlet weak var telephonebutton: Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       teltextfield.layer.cornerRadius=teltextfield.frame.size.height/2;
        self.navigationItem.title = "Etape 2/4";

        telephonebutton.layer.shadowColor = UIColor.black.cgColor
        telephonebutton.layer.shadowOpacity = 0.5
        telephonebutton.layer.shadowOffset = CGSize(width: 2, height: 2)

      teltextfield.keyboardType = .numberPad
    }
    
    @IBAction func mobileOTPonclick(_ sender: Any)
    {
         self.performSegue(withIdentifier: "mobileOTP",sender: nil)
        
        //let telephonenum = teltextfield.text
        
       // print("telephonenum: \(String(describing: telephonenum))")
        
        
       /* let params = ["action":"etape2","user_mobile":"5555555555","userid":"3"]
            print("params: \(params)")
            
        let urlObj = "https://xb7m61kx02.execute-api.us-east-1.amazonaws.com/dev/user"
         
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: urlObj)!)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
        } catch let error {
            
            print(error.localizedDescription)
        }
        
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            // print("ERR: \(error?.localizedDescription)")
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            /*guard error == nil
             else{
             return
             }
         
             guard let data = data else {
             return
             }*/
            
            if(statusCode == 200){
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                    print("******")
                    print("JSON: \(json)")
                    print("******")
                    
                    
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
                
            }
            
        }
        task.resume()
        
        
    }
    
func displayAlertMessage(messageToDisplay: String)
{
    let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
    
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        
        
        // Code in this block will trigger when OK button tapped.
        //print("Ok button tapped");
        
    }
    
    alertController.addAction(OKAction)
    
    self.present(alertController, animated: true, completion:nil)
}*/

}
    
}

