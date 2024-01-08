//
//  EntryViewController.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskDescription: UITextField!
    @IBOutlet var taskPriority: UITextField!
    @IBOutlet var taskDueDate: UITextField!
    @IBOutlet var taskAllocTime: UITextField!
    
    var taskModel: TaskModel?
    
    //weak var delegate: TaskViewControllerDelegate?
    
    @IBAction func titleDidChanged(_ sender: UITextField) {
        taskModel?.title = sender.text ?? ""
    }
    
    @IBAction func descriptionDidChanged(_ sender: UITextField) {
        
        taskModel?.description = sender.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitle.delegate = self
        
        taskModel = TaskModel(
            id: 0,
            title: "",
            description: "",
            priority: 1,
            due_date: Date(),
            alloc_time: 0.0,
            isCompleted: false,
            isArchived: false
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        
        taskTitle.text = taskModel?.title
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    @objc func saveTask(){
        
        guard let updatedTaskModel = taskModel, !updatedTaskModel.title.isEmpty
        else {
            return
        }
        
        TaskManager.shared.updateTask(newTaskModel: updatedTaskModel)
                
        self.tabBarController?.selectedIndex = 0
        
        taskTitle.text = ""
        taskDescription.text = ""
        taskPriority.text = ""
        taskDueDate.text = ""
        taskAllocTime.text = ""
        
    }
    
}
