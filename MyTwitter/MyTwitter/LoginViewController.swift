//
//  LoginViewController.swift
//  MyTwitter
//
//  Created by mac on 2/21/17.
//  Copyright © 2017 Muhammad Umair Khokhar. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string:"https://api.twitter.com")! as URL!, consumerKey: "HRoCTXZekLHeT6tbgiLXsYQtJ", consumerSecret: "oJxj54rOFvXGF0yAC1Jgdh41FsjXP6QbhceeVv4oIF2P2uDW1U")
        
        twitterClient?.deauthorize()
        
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth") as URL!, scope: nil, success: { (requestToken: BDBOAuth1Credential?) in
            print("I got a token!")
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")!
            UIApplication.shared.openURL((url as? URL)!)
        
        
        }, failure: { (error: Error?) in
                print("error: \(error?.localizedDescription)")
        })
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
