//
//  HomeViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks = tasksArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        // Get all current saved tasks
        updateTask()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTask()
    }
    
    
    func updateTask() {
        //tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            
            if let task = UserDefaults().value(forKey: "task \(x+1)") as? String {
                tasks.append(
                    TaskModel(
                        id: 0,
                        title: task,
                        descriotion: nil,
                        priority: 0,
                        due_date: Date(),
                        alloc_time: 0.0, 
                        isCompleted: false,
                        isArchived: false
                    )
                )
            }
        }
        
        tableView.reloadData()
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        
        vc.title = tasks[indexPath.row].title
        vc.task = tasks[indexPath.row]
        vc.delegate = self
        vc.tableView = self.tableView 
        
        vc.update = {
            DispatchQueue.main.async {
                self.updateTask()
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
        updateTask()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "home_cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row].title
        
        return cell
    }
}

extension HomeViewController: TaskViewControllerDelegate, EntryViewControllerDelegate {
    func updateTasks() {
        self.updateTask()
    }
}
