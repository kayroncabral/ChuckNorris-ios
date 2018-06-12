//
//  URL.swift
//  Chuck Norris
//
//  Created by Kayron Cabral on 11/06/2018.
//  Copyright © 2018 Kayron Cabral. All rights reserved.
//

import Foundation

class URLS {
    private static let baseUrl = "https://api.chucknorris.io/jokes"
    
    static var categories = baseUrl + "/categories"
    static var randomJoke = baseUrl + "/random?category={category}"
}
