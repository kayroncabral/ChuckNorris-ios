//
//  Joke.swift
//  Chuck Norris
//
//  Created by Kayron Cabral on 11/06/2018.
//  Copyright © 2018 Kayron Cabral. All rights reserved.
//

import Foundation

class Joke {
    var id: String?
    var categories = [String]()
    var iconUrl: String?
    var url: String?
    var value: String?
    
    init(data: AnyObject) {
        if let id = data["id"] as? String {
            self.id = id
        }
        
        if let categories = data["category"] as? [String] {
            self.categories = categories
        }
        
        if let iconUrl = data["icon_url"] as? String {
            self.iconUrl = iconUrl
        }
        
        if let url = data["url"] as? String {
            self.url = url
        }
        
        if let value = data["value"] as? String {
            self.value = value
        }
    }
}
