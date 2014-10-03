//
//  Bear.swift
//  iFUSD
//
//  Created by Wilson Zhao on 10/2/14.
//  Copyright (c) 2014 Wilson Zhao. All rights reserved.
//

import Foundation
import JSONJoy
class Bear : JSONJoy {
    var __v: Int?
    var _id: String?
    var name: String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder) {
        __v = decoder["__v"].integer
        _id = decoder["_id"].string
        name = decoder["name"].string
    }
}