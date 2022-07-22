//
//  Models.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/21/22.
//

import Foundation

class DataMeneger {
    static var shared = DataMeneger()
    
    private init() {}
    
    var names = ["Max", "Stas", "Alex", "Mihail",
                 "Carl", "Tod", "Tom", "Tim"]
    
    var lastNames = ["Green", "White", "Black", "Yellow",
                     "Grey", "Red", "Pink", "Brown"]
    
    var emails = ["jjj@gmail.com", "qqq@gmail.com", "www@gmail.com",
                  "eee@gmail.com", "fff@gmail.com", "ggg@gmail.com",
                  "ccc@gmail.com", "aaa@gmail.com"]
    
    var phonNumbers = ["48392", "34245", "87654", "74463",
                       "65464", "34563", "34563", "45623"]
}

struct Person {
    let name: String
    let lastName: String
    let phonNumber: String
    let email: String
    
    var fullName: String {
        "\(name) \(lastName)"
    }
    
    static func getContactList() -> [Person] {
        var persons: [Person] = []
        
        let names = DataMeneger.shared.names.shuffled()
        let lastNames = DataMeneger.shared.lastNames.shuffled()
        let phoneNumbers = DataMeneger.shared.phonNumbers.shuffled()
        let emails = DataMeneger.shared.emails.shuffled()
        
        for index in 0..<names.count {
            let person = Person(name: names[index],
                                lastName: lastNames[index],
                                phonNumber: phoneNumbers[index],
                                email: emails[index])
            persons.append(person)
        }
        return persons
    }
}
