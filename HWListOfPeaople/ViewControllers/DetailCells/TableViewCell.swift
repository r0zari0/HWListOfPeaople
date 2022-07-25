//
//  TableViewCell.swift
//  HWListOfPeaople
//
//  Created by Max Stovolos on 7/24/22.
//

import UIKit

//MARK: - SectionCell

class TableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

//MARK: - Private Extentions

extension TableViewCell {
    func setupUI() {
        selectionStyle = .none
    }
    
    func config(userInfo: String, state: Contacts) {
        userLabel.text = userInfo
        userImageView.image = UIImage(systemName: state.rawValue)
    }
}
