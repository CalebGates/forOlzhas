//
//  SectionHeader.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import UIKit

class SectionHeader: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var dateInHeaderLabel: UILabel!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib() }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") }
    
    func loadNib() {
        Bundle.main.loadNibNamed("SectionHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth] } }
