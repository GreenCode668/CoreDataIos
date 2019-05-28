//
//  ViewController.swift
//  offlineCoreFirebsae
//
//  Created by saad pasta on 28/05/2019.
//  Copyright © 2019 saad pasta. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fetchRequest  : NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let people = try OfflineService.context.fetch(fetchRequest)
            self.people = people
            self.tableView.reloadData()
        }
        catch{
            print("Kuch Nahi Hua Jani Error A Gayaaa")
        }
    }
    
    
    @IBAction func onPlusTapped(_ sender: Any) {
    let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name  = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            print(name)
            print(age)
            let person = Person(context: OfflineService.context)
            person.name = name
            person.age = Int16(age)!
            OfflineService.saveContext()
            self.people.append(person)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
    }
    

}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].name
        cell.detailTextLabel?.text = String(people[indexPath.row].age)
        
        return cell
    }
}
