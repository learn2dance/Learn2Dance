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
        let video = PFObject(className: "Video")
        
        video["link"] = linkText.text!
        video["description"] = descriptionText.text!
        
        video.saveInBackground(){
            (success, error) in
            if success{
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
