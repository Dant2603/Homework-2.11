//
//  ViewController.swift
//  Homework 2.11
//
//  Created by Мария Гетманская on 29.09.2024.
//

import UIKit

final class PersonsListViewController: UITableViewController {
    
    var personsList = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarControllers = tabBarController?.viewControllers {
            if let secondNС = tabBarControllers[1] as? UINavigationController,
               let personsListSectionedVC = secondNС.topViewController as? PersonsListSectionedViewController {
                personsListSectionedVC.personsList = self.personsList
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        guard let personDetailsVC = segue.destination as? PersonDetailsViewController else { return }
        personDetailsVC.person = personsList[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsList.count
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

// MARK: - UITableViewDelegate
extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
}
