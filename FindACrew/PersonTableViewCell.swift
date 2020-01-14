//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Aaron Cleveland on 1/14/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = person.gender
        birthYearLabel.text = person.birthYear
    }
}
