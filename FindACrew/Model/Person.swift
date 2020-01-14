//
//  Person.swift
//  FindACrew
//
//  Created by Aaron Cleveland on 1/14/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
}

struct PersonSearch: Decodable {
    let results: [Person]
}
