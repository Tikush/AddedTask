//
//  CountryCell.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var flag: UIImageView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: Country.Data) {
        titleLabel.text = item.name
        flag.loadSVG(url: item.flag ?? "")
    }
}

