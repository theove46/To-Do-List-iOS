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
    @IBOutlet var taskDueDate: UIDatePicker!
    @IBOutlet var taskAllocTime: UITextField!
    
    var taskModel: TaskModel?
    
    //weak var delegate: TaskViewControllerDelegate?
    
    let priorityLevel: [String] = ["1", "2", "3", "4", "5"]
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    @IBAction func titleDidChanged(_ sender: UITextField) {
        taskModel?.title = sender.text ?? ""
    }
    
    @IBAction func descriptionDidChanged(_ sender: UITextField) {
        
        taskModel?.description = sender.text ?? ""
    }
    
    
    @IBAction func dueDateDidChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm - dd/MM/yy"
        
        let formattedDate = dateFormatter.string(from: sender.date)
        taskModel?.due_date = dateFormatter.date(from: formattedDate)!
    }
    
    
    @IBAction func alloctimeChanged(_ sender: UITextField) {
        
        taskModel?.alloc_time = Double(sender.text ?? "") ?? 0.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitle.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        taskModel = TaskModel(
            id: 0,
            title: "",
            description: "",
            priority: 1,
            due_date: Date(),
            alloc_time: 1,
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
        taskDueDate.date = Date()
        taskAllocTime.text = ""
        
    }
}

extension EditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return priorityLevel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "priority_cell", for: indexPath) as! PriorityCellViewController
        
        cell.priorityLevel.setTitle(priorityLevel[indexPath.row], for: .normal)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PriorityCellViewController {
            cell.contentView.backgroundColor = .clear
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PriorityCellViewController {
            cell.contentView.backgroundColor = .clear
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PriorityCellViewController {
            
            cell.showIcon()
            cell.setBackgroundColor(selected: true)
            
            
            if let selectedPriority = cell.priorityLevel.currentTitle,
               let priorityInt = Int(selectedPriority) {
                taskModel?.priority = priorityInt
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PriorityCellViewController {
            
            cell.hideIcon()
            cell.setBackgroundColor(selected: false)
        }
    }
    
}
