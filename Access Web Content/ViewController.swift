//
//  ViewController.swift
//  Access Web Content
//
//  Created by Yosemite on 1/13/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Step1. Construct the URL by NSURL()
        var url = NSURL(string: "http://www.stackoverflow.com")
        // Step2. Create the session by NSURLSession.sharedSession()
        let session = NSURLSession.sharedSession()
        // Step3. Add a task to the session by dataTaskWithURL(), then calls a handler upon completion.
        //        - Creates an HTTP GET request for the specified URL.
        //        - 3 types of parameters are required in handler: NSData, NSURLResponse,  NSError
        //        - return value can be none or void
        let task = session.dataTaskWithURL(url!) {(webData, webResponse, webError) in
            // Step3.1 Encode data aquired from URL by UTF8 into readable text
            var textFromUTF8 = NSString(data: webData, encoding: NSUTF8StringEncoding)
            println(textFromUTF8)
        }
        // Step4. Run the task
        task.resume()
        
        // Step2 and 3 can be combined.
        /*
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            println(data)
        }
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

