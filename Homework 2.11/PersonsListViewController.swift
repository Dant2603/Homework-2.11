//
//  ViewController.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 29.09.2024.
//

import UIKit

final class PersonsListViewController: UITableViewController {

    private var personsList = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


// MARK: - UITableViewDataSource
extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personsList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = ("\(person.firstName) \(person.lastName)")
        
        cell.contentConfiguration = content
        return cell
    }
}

