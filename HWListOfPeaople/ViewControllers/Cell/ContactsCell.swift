//
//  ContactsCell.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/20/22.
//

import UIKit

//MARK: - ContactsCell
class ContactsCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with model: Person) {
        nameLabel.text = model.fullName
    }
}

//MARK: - Private Extention

extension ContactsCell {
    func setupUI() {
        
    }
}
