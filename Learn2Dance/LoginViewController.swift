//
//  LoginViewController.swift
//  Learn2Dance
//
//  Created by William Hutt on 4/10/19.
//  Copyright © 2019 William Hutt. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogin(_ sender: Any) {
        let username = usernameText.text!
        let password = passwordText.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password ) { (user,error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                 print("Error \(error?.localizedDescription)")
            }
            
        }
        
        
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = usernameText.text
        user.password = passwordText.text
        
        user.signUpInBackground{(success,error  ) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error \(error?.localizedDescription)")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}