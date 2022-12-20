//
//  Country.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import Foundation

struct Country: Codable {
    let data: [Data]
    
    struct Data: Codable {
        let name: String?
        let flag: String?
    }
}


