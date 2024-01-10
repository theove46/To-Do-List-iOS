//
//  HomeViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks: [TaskModel] {
        return TaskManager.shared.tasks
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Enable multiple selection during editing
        tableView.allowsMultipleSelectionDuringEditing = true
        
        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        // Get all current saved tasks
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        
        vc.title = tasks[indexPath.row].title
        vc.task = tasks[indexPath.row]
        //vc.delegate = self
        vc.tableView = self.tableView
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Enable swipe-to-delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the task from TaskManager
            TaskManager.shared.deleteTask(at: tasks[indexPath.row].id - 1)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "home_cell", for: indexPath) as! CustomCellViewController
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm - dd/MM/yy"
        
        cell.taskTitle?.text = tasks[indexPath.row].title
        cell.taskDescription?.text = tasks[indexPath.row].description
        cell.taskPriority?.text = "\(tasks[indexPath.row].priority)"
        cell.taskDueDate?.text = dateFormatter.string(from: tasks[indexPath.row].due_date)
        cell.taskAllocTime?.text = "\(tasks[indexPath.row].alloc_time)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}


//extension HomeViewController: TaskViewControllerDelegate, EditViewControllerDelegate {
//    func updateTasks(with taskModel: TaskModel?) {
//        self.updateTask(newTaskModel: taskModel)
//    }
//}

