//
//  AddSessionVC.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import UIKit

class AddSessionVC: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dateDP: UIDatePicker!
    @IBOutlet weak var timeBegDP: UIDatePicker!
    @IBOutlet weak var timeEndDP: UIDatePicker!
    @IBOutlet weak var sessionTF: UITextField!
    @IBOutlet weak var venueTF: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil) }
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainVC", sender: self) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        let label = UILabel(frame: header.bounds)
        label.text = "Добавить новое мероприятие"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        header.addSubview(label)
        tableView.tableHeaderView = header
        
        sessionTF.delegate = self
        venueTF.delegate = self
        addButton.isEnabled = false }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if sessionTF.text != nil && sessionTF.text  != "" { addButton.isEnabled = true } else {
            addButton.isEnabled = false }
        if venueTF.text != nil && venueTF.text != "" { addButton.isEnabled = true} else {
            addButton.isEnabled = false } } }
