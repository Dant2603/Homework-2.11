//
//  PersonDetailsController.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 02.10.2024.
//

import UIKit

final class PersonDetailsViewController: UIViewController {
        
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberLabel.text = "Phone number: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
