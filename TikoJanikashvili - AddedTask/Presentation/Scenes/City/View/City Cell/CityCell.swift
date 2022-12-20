//
//  CityCell.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 19.12.22.
//

import UIKit

class CityCell: UITableViewCell {

    // MARK: - Private IBOutlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with name: String) {
        cityNameLabel.text = name
    }
}
