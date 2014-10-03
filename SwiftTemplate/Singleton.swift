//
//  Singleton.swift
//  SwiftSkeleton
//
//  Created by Wilson Zhao on 8/15/14.
//  Copyright (c) 2014 Wilson Zhao. All rights reserved.
//

import Foundation
import UIKit

@objc protocol SingletonDelegate {
    optional func didGetBears()
}

class Singleton {
    // Delegate
    var delegate : SingletonDelegate?
    class var sharedInstance : Singleton {
    struct Static {
        static let instance : Singleton = Singleton()
        }
        return Static.instance
    }
    
    
    
    // Core Variables
    var apikey : String = "apikeyhere"
    
    
    
    // Global variables
    var bears : NSMutableArray = []
    
    
    
    
    
   
    
    
 
    

}