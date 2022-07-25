//
//  ViewController.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/23/22.
//

import UIKit

class SortedContacts: UIViewController {
    
    //MARK: = INOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var persons: [Person] = []
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
//MARK: - Private Extentions

private extension SortedContacts {
    func setupUI() {
        setupNvigatioinController()
        setupTableView()
    }
    
    func setupNvigatioinController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Person List"
        
    }
    
    func setupTableView() {
        let nib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TableViewCell.self))
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configDataCell(indexPath: IndexPath) -> (userInfo: String, state: Contacts) {
        let person = persons[indexPath.section]
        let isFirstCell: Bool = indexPath.row == 0
        let state: Contacts = isFirstCell ? .phone : .gmail
        let userInfo = isFirstCell ? person.phonNumber : person.email
        
        return (userInfo, state)
    }
}

extension SortedContacts: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        let cellData = configDataCell(indexPath: indexPath)
        
        
        cell.config(userInfo: cellData.userInfo, state: cellData.state)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = persons[section].fullName
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .red
    }
}
