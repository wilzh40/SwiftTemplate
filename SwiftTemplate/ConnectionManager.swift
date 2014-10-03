//
//  ConnectionManager.swift
//  iFUSD
//
//  Created by Wilson Zhao on 9/15/14.
//  Copyright (c) 2014 Wilson Zhao. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON
import JSONJoy


// This is my local RESTFUL testing setup using node and express.js, as well as modular databse
var apikey : String = "apikeyhere"
var url : String = "http://localhost:8080"


protocol ConnectionProtocol {

}
class ConnectionManager {
    var delegate : ConnectionProtocol?
    
    // Singleton
    class var sharedInstance : ConnectionManager {
    struct Static {
        static let instance : ConnectionManager = ConnectionManager()
        }
        return Static.instance
    }

    
    // Functions
    class func addBear(name:String) {
        Alamofire.request(.POST, url + "/api/bears", parameters: ["name":name], encoding: .JSON)
            .responseJSON(options: NSJSONReadingOptions.MutableContainers){(request, response, JSON, error) in
                println(JSON)
                if error == nil {
                    self.getBears()
                } else {
                    println(error)
                }
        }
    
    }

    class func getBears() {
        Alamofire.request(.GET, url + "/api/bears")
        .responseJSON(options: NSJSONReadingOptions.MutableContainers){(request, response, JSON, error) in
            println(JSON)
            if error == nil {
                Singleton.sharedInstance.bears = []
                for data in JSON? as NSMutableArray {
                    var bear = Bear(JSONDecoder(data))
                    println("name is: \(bear.name?)")
                    Singleton.sharedInstance.bears.addObject(Bear(JSONDecoder(data)))
                }
        
                Singleton.sharedInstance.delegate?.didGetBears!()
            } else {
                println(error)
            }
            
        }
    }
    class func testNetworking() {
        // Testting an http networking client for swift!
        Alamofire.request(.GET, url + "/api")
            .response { (request, response, data, error) in
                println(request)
                println(response)
                
                if error != nil {
                    println(error)
                }
        }
        
    }
    

}