//
//  Author.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/9/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit
import XMLMapper

class Author: XMLMappable {
    var nodeName: String!
    
    var name: String!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        name <- map["name"]
    }
}

