//
//  Models.swift
//  MVVMExample
//
//  Created by Jackie Lu on 2024/10/15.
//

import Foundation

enum Gender {
    case male, female, unspecified
}
struct Person {
    let name: String
    let birthday: Date?
    let middleName: String?
    let address: String?
    let gender: Gender
    
    var username = "KanyeWest"
    
    init(name: String,
         birthday: Date? = nil,
         middleName: String? = nil,
         address: String? = nil,
         gender: Gender = .unspecified
    ) {
        self.name = name
        self.birthday = birthday
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}
