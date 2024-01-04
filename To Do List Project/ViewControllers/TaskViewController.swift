//
//  TaskViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

protocol TaskViewControllerDelegate: AnyObject {
    func updateTasks()
    func deleteTask()
}

extension TaskViewControllerDelegate {
    func deleteTask() {
        //
    }
}

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var task: TaskModel?
    var tableView: UITableView?
    weak var delegate: TaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task?.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        
        guard let tableView = tableView else {
            return
        }
        
        if let count = UserDefaults().value(forKey: "count") as? Int {
            
            tableView.reloadData()
            delegate?.updateTasks()
            navigationController?.popViewController(animated: true)
        }
    }

}
