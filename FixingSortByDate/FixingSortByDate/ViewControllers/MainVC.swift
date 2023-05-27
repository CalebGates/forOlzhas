//
//  MainVC.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    var sessions: [Session] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].sessions.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        let Session = sessions[indexPath.row]
        cell.timeBegLabel.text = Session.formattedTimeBeg
        cell.timeEndLabel.text = Session.formattedTimeEnd
        cell.sessionLabel.text = Session.sessionModel
        cell.venueLabel.text = Session.venueModel
        return cell }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeader()
        let date = sections[section].sectionDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let string = dateFormatter.string(from: date)
        let weekDay = date
        let weekDayFormatter = DateFormatter()
        weekDayFormatter.dateFormat = "EEEE"
        let formattedWeekDay = weekDayFormatter.string(from: weekDay)
        let finalFormattedWeekDay = formattedWeekDay.capitalized
        header.dateInHeaderLabel.text = string
        header.dayOfTheWeekLabel.text = "(\(finalFormattedWeekDay))"
        return header }
    
    func sortByDate() {
        let dates = sessions.reduce(into: Set<Date>()) { result, sessions in
            let date = Calendar.current.startOfDay(for: sessions.dateModel!)
            result.insert(date)
        }
        for date in dates {
            let dateComp = Calendar.current.dateComponents([.year, .month, .day], from: date)
            var sortedContent: [Session] = []
            sessions.forEach { sessions in
                let contComp = Calendar.current.dateComponents([.year, .month, .day], from: sessions.dateModel!)
                if contComp == dateComp {
                    sortedContent.append(sessions)
                }
            }
            let newSection = Section(sectionDate: date, sessions: sortedContent)
            sections.append(newSection)
        }
    }
    
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
        guard let vc = segue.source as? AddSessionVC else { return }
        guard let date = vc.dateDP?.date, let timeBeg = vc.timeBegDP?.date, let timeEnd = vc.timeEndDP?.date, let session = vc.sessionTF.text, let venue = vc.venueTF.text else { return }
        let Session = Session(dateModel: date, timeBegModel: timeBeg, timeEndModel: timeEnd, sessionModel: session, venueModel: venue)
        sessions.append(Session)
        sortByDate()
        sessions.sort { $0.timeBegModel! < $1.timeEndModel! }
        tableView.reloadData()
    }
    
    
}
