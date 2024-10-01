//
//  Person.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 02.10.2024.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    
    static func getPerson() -> [Person] {
        [
            Person(firstName: "Иван", lastName: "Иванов", email: "ivanov@mail.ru", phone: "+79111111111"),
            Person(firstName: "Петр", lastName: "Петров", email: "petrov@mail.ru", phone: "+79111111112")
        ]
    }
    
    }
