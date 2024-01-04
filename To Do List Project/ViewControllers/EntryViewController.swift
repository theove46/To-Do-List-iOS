//
//  EntryViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

protocol EntryViewControllerDelegate: AnyObject {
    func updateTasks()
}

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet  var field: UITextField!
    weak var delegate: TaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task \(newCount)")
        
        delegate?.updateTasks()
        
        self.tabBarController?.selectedIndex = 0
        
        field.text = ""
    }

}
