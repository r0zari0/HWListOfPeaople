//
//  ViewController.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/20/22.
//

import UIKit

class ContactsVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    //MARK: - Properties
    
    var persons: [Person] = []
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Private Extensions

private extension ContactsVC {
    func setupUI() {
        setupTableView()
        setupTabeleview()
    }
    
    func  setupTabeleview() {
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        let nib = UINib(nibName: String(describing: ContactsCell.self), bundle: nil)
        contactsTableView.register(nib, forCellReuseIdentifier: String(describing: ContactsCell.self))
        
        contactsTableView.rowHeight = 40
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    func showFullInformation(person: Person) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "detailinformation") as! InformationVC
        navigationController?.pushViewController(viewcontroller, animated: true)
        
        viewcontroller.personInformation = person
    }
}



//MARK: - UITableViewDelegate

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = persons[indexPath.row]
        showFullInformation(person: person)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactsCell.self), for: indexPath) as! ContactsCell
        let somebody = persons[indexPath.row]
        
        cell.config(with: somebody)
        return cell
    }
}
