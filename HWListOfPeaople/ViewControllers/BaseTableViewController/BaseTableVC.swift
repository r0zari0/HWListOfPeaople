//
//  BaseTableVC.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/24/22.
//

import UIKit

class BaseTableVC: UITabBarController {
    
    let person = Person.getContactList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers(with: person)
    }
    
    private func setupViewControllers(with person: [Person]) {
        let contactNavVC = viewControllers?.first as! UINavigationController
        let contactVC = contactNavVC.topViewController as! ContactsVC
        contactVC.persons = person
        
        let sectionNavVC = viewControllers?.last as! UINavigationController
        let sectionVC = sectionNavVC.topViewController as! SortedContacts
        sectionVC.persons  = person
    }
}
