//
//  Cell.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var timeBegLabel: UILabel!
    @IBOutlet weak var timeEndLabel: UILabel!
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib() }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) } }
