//
//  TaskViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

//protocol TaskViewControllerDelegate: AnyObject {
//    func updateTasks(with taskModel: TaskModel?)
//    func deleteTask(at index: Int)
//}
//
//extension TaskViewControllerDelegate {
//
//    func deleteTask(at index: Int) {
//        self.deleteTask(at: index)
//    }
//}


import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var taskTitle: UILabel!
    @IBOutlet var taskDescription: UILabel!
    @IBOutlet var taskPriority: UILabel!
    @IBOutlet var taskDueDate: UILabel!
    @IBOutlet var taskAllocTime: UILabel!
    
    var task: TaskModel?
    var tableView: UITableView?
    //weak var delegate: TaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTitle.text = task?.title
        taskDescription.text = task?.description ?? ""
        taskPriority.text = "\(task?.priority ?? 1)"
        taskAllocTime.text = "\(task?.alloc_time ?? 0.0)"
        if let dueDate = task?.due_date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm - dd/MM/yy"
            taskDueDate.text = dateFormatter.string(from: dueDate)
        } else {
            taskDueDate.text = ""
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        if let taskId = task?.id {
            TaskManager.shared.deleteTask(at: taskId - 1)
            navigationController?.popViewController(animated: true)
            tableView?.reloadData()
        }
    }
}
