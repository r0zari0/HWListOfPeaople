//
//  ViewController.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/20/22.
//

import UIKit

//MARK: - InformationVC

class InformationVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    //MARK: - Propertis
    
    var personInformation: Person!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
}

//MARK: - Private Extention

extension InformationVC {
    func setupUi() {
        emailLabel.text = "Email: \(personInformation.email)"
        phoneLabel.text = "Phone: \(personInformation.phonNumber)"
    }
}
