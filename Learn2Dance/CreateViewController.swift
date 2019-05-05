//
//  CreateViewController.swift
//  Learn2Dance
//
//  Created by William Hutt on 4/10/19.
//  Copyright © 2019 William Hutt. All rights reserved.
//

import UIKit
import Parse

class CreateViewController: UIViewController {

    @IBOutlet weak var linkText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onUpload(_ sender: Any) {
        
        
        let post = PFObject(className: "Posts")

        post["link"] = linkText.text!
        post["description"] = descriptionText.text!
        post["author"] = PFUser.current()!
 
        post.saveInBackground(){
            (success, error) in
            if success {
              self.dismiss(animated: true, completion: nil)
              print("saved")
            }
            else {
                print("error!")
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
