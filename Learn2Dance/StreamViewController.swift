//
//  StreamViewController.swift
//  Learn2Dance
//
//  Created by William Hutt on 4/10/19.
//  Copyright © 2019 William Hutt. All rights reserved.
//

import UIKit
import WebKit
import Parse
class StreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let query = PFQuery(className: "Posts")
            query.includeKey("author")
            query.limit = 20
    
            query.findObjectsInBackground { (posts, error) in
                if posts != nil {
                    self.posts = posts!
                    self.tableView.reloadData()
                }
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        
                let post = posts[indexPath.row]
                let user = post["author"] as! PFUser
                cell.userLabel.text = user.username
                cell.descriptionLabel.text = post["description"] as! String
                let link = post["link"] as! String
                let url = URL(string: link)!
                cell.embeddedView.load(URLRequest(url:url))
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func onLogout(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginView = main.instantiateViewController(withIdentifier: "LoginView")
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginView
        
    }
    
}
