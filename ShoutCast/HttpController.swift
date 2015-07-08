//
//  HttpController.swift
//  ShoutCast
//
//  Created by Dieter Kohl on 4/10/15.
//  Copyright (c) 2015 Dieter Kohl. All rights reserved.
//

import UIKit

protocol HttpProtocol {
    func didRecieveResults(resultes:NSDictionary)

}
class HttpController: NSObject {
    
    var delegate:HttpProtocol?
    
    func onSearch(url:String){
        var nsUrl:NSURL? = NSURL(string: url)
        
        var request:NSURLRequest? = NSURLRequest(URL: nsUrl!)
        
        NSURLConnection.sendAsynchronousRequest(request!, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            var jsonResult:NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            
            self.delegate?.didRecieveResults(jsonResult!)
        })
      
    }
    
   
}
