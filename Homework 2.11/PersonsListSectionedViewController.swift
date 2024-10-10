//
//  PersonsListFullDetailController.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 03.10.2024.
//

//
//  ViewController.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 29.09.2024.
//

import UIKit

final class PersonsListSectionedViewController: UITableViewController {
    
    var personsList: [Person] = []
        
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        guard let personDetailsVC = segue.destination as? PersonDetailsViewController else { return }
        personDetailsVC.person = personsList[indexPath.row]
    }
    
}

// MARK: - UITableViewDataSource
extension PersonsListSectionedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(personsList[section].firstName) \(personsList[section].lastName)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personSection", for: indexPath)
        let person = personsList[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.text = "\(person.phoneNumber)"
            content.image = UIImage(systemName: "phone")
        } else if indexPath.row == 1 {
            content.text = "\(person.email)"
            content.image = UIImage(systemName: "envelope")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PersonsListSectionedViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
}
