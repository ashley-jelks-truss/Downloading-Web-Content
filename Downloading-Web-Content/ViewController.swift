//
//  ViewController.swift
//  Downloading-Web-Content
//
//  Created by Ashley Jelks on 1/4/16.
//  Copyright © 2016 Ashley Jelks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url  = NSURL(string: "https://www.apple.com")!
        //^^converts to a URL than can be used in other functions
        //By default NSURL is a optional, so we are unwrapping it in the initial constant declaration
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            //Task is a closure or completion handler, a function that will run the following code after the URL function(is complete.) returns the data, a response, and if applicable and error message
            
            if let urlContent = data {
            //this checks to see if the var data exists and if it does it sets urlContent to it
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                //^^Because web data is encoded, we use this variable to convert the Encoding of the URL to UTF8 human readable text
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //^^This code forces the queue to end after web data has been downloaded then calls the following code to display the web content in the WebView Controller
                    
                    
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                    //^^loads the contents of urlContent into a WebView Object on the Main.Storyboard, converting it from type NSString to type String
                    //Also we use self here because to access objects outside of a closure (here, the View Controller) the program needs to know where to find the Object. The object WebView is in the View Controller, so self
                })
                
                
            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}









