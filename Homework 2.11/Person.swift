//
//  Person.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 02.10.2024.
//

import UIKit

struct Person {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    
    static func getPerson() -> [Person] {
        let dataStore = DataStore()
        
        var firstNames = dataStore.firstNames
        var lastNames = dataStore.lastNames
        var emails = dataStore.emails
        var phones = dataStore.phoneNumbers
        
        var persons: [Person] =  []
        
        let limit = min(firstNames.count, lastNames.count, emails.count, phones.count)
        
        for _ in 0..<limit {
            let firstName = firstNames.remove(at: Int.random(in: 0..<firstNames.count))
            let lastName = lastNames.remove(at: Int.random(in: 0..<lastNames.count))
            let email = emails.remove(at: Int.random(in: 0..<emails.count))
            let phoneNumber = phones.remove(at: Int.random(in: 0..<phones.count))
            
            let person = Person(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber)
            persons.append(person)
        }
        
        return persons
        
    }
    
}
