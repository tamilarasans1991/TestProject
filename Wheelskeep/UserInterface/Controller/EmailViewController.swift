//
//  ViewController.swift
//  Wheelskeep
//
//  Created by Chandirabalan A on 09/08/17.
//  Copyright © 2017 Wheelskeep. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
//import FBSDKLoginKit



class EmailViewController: UIViewController {
    
     @IBOutlet weak var textemailname: UITextField!
     @IBOutlet weak var textpassword: UITextField!
     @IBOutlet weak var signuponclick: Button!
    
    
     //@IBOutlet weak var fbbutton: UIButton!
    // var buttonfacebook : FBSDKLoginButton = FBSDKLoginButton()
    
    
    override func viewDidLoad() {
        
    
          super.viewDidLoad()
        textemailname.layer.cornerRadius=textemailname.frame.size.height/2;
        textpassword.layer.cornerRadius=textpassword.frame.size.height/2;
        self.navigationItem.title = "Je m'inscris";
        
        signuponclick.layer.shadowColor = UIColor.black.cgColor
        signuponclick.layer.shadowOpacity = 0.5
        signuponclick.layer.shadowOffset = CGSize(width: 2, height: 2)

        textpassword.isSecureTextEntry = true
        
        
        
        self.textemailname.keyboardType = UIKeyboardType.emailAddress
        
    }

       // self.buttonfacebook.delegate = self
       /* if(FBSDKAccessToken.current() == nil){
            
            
            print("Not Login")
        }
        else{
            
            print("Login")
        }
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","user_email"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    
    }
    
    @IBAction func buttonclicked(sender: AnyObject){
    
    buttonfacebook.sendActions(for: UIControlEvents.touchUpInside)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton:FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!,error: NSError){
        
        print(result.token.tokenString)
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" :"user_email,name"], tokenString: result.token.tokenString, version: nil, httpMethod: "POST")
        req?.startWithCompletionHandler({ (connection, result, error : NSError!)->Void in
            if(error == nil)
            {
                    let userfacebook = result.valueForKey("user_email") as! String
                print("userfacebook: \(userfacebook)")
                
                
            }
            else{
                
                
            }
        
    })*/
    
    
    @IBAction func telephoneClick(_ sender: Any) {
        
        let emailnametext = textemailname.text
        let passwordtext = textpassword.text
       
        
        if(emailnametext == "" || passwordtext == ""){
            
            displayAlertMessage(messageToDisplay: "Please enter the credentials!")
    
        }else{
            
            let params = ["userEmail" :emailnametext,"userPassword" :passwordtext,"userLoginType" : "Normal"]
            
            print("params: \(params)")
            
            let urlObj = "https://xb7m61kx02.execute-api.us-east-1.amazonaws.com/dev/user"
            
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: urlObj)!)
            request.httpMethod = "POST"
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
                    
                    
                    let success = json["Success"] as? String
                    //let statuscode =  json["statusCode"] as? String
                    let status = json["status"] as? String
                    let message =  json["message"] as? String
                        
                    print("success: \(String(describing: success))")
                    print("status: \(String(describing: status))")
                    print("message: \(String(describing: message))")
                  
                    
                       /* let jsonData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                        
                        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                        
                        print(jsonString)*/
                    
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
                
            }
                
            }
            task.resume()
            
            
        }
        
        
        self.performSegue(withIdentifier: "telephoneViewController",sender: nil)
        displayAlertMessage(messageToDisplay: "Register Successfully!")
    }
    
    
    // Alert message code
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            
            // Code in this block will trigger when OK button tapped.
            //print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }

    
    // EmailAddress Validation
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
                
                
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    
    /*else {
     let isEmailAddressValid = isValidEmailAddress(emailAddressString: emailnametext!)
     
     
     if isEmailAddressValid{
     
     print("Email address is valid")
     displayAlertMessage(messageToDisplay: "RegisterSuccessfully!")
     self.performSegue(withIdentifier: "telephoneViewController",sender: nil)
     
     
     
     }
     else{
     print("Email address is not valid")
     displayAlertMessage(messageToDisplay: "Email address is not valid")
     
     }
     }
     
     let passwordvalid  = isPasswordValid(passwordtext!)
     
     if passwordvalid {
     
     print("Password  is valid")
     displayAlertMessage(messageToDisplay: "RegisterSuccessfully!")
     }
     else{
     print("Password is not valid")
     displayAlertMessage(messageToDisplay: "Password is not valid")
     
     }*/
    
    //let params = ["user_email" : "phptest10001@gmail.com","user_password" : "test","tagLoginType" : "gplus"]
    
    
}
