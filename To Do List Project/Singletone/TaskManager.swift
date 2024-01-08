//
//  TaskManager.swift
//  To Do List Project
//
//  Created by BS1098 on 8/1/24.
//

import Foundation

class TaskManager {
    static let shared = TaskManager()
    
    private init() {
        loadTasks()
    }
    
    var tasks = [TaskModel]()
    
    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: "tasks")
        } catch {
            print("Error encoding tasks: \(error)")
        }
    }
    
    private func loadTasks() {
        if let encodedData = UserDefaults.standard.data(forKey: "tasks") {
            do {
                tasks = try JSONDecoder().decode([TaskModel].self, from: encodedData)
            } catch {
                print("Error decoding tasks: \(error)")
            }
        }
    }
    
    func updateTask(newTaskModel: TaskModel? = nil) {
        if var newTaskModel = newTaskModel {
            newTaskModel.id = tasks.count + 1
            tasks.append(newTaskModel)
            saveTasks()
        }
    }
    
    func deleteTask(at index: Int) {
        if index >= 0 && index < tasks.count {
            tasks.remove(at: index)
            updateTaskIndices()
            saveTasks()
        }
    }
    
    private func updateTaskIndices() {
            for (index, var task) in tasks.enumerated() {
                task.id = index + 1
                tasks[index] = task
            }
        }
    
    func clearTasks() {
        tasks.removeAll()
        saveTasks()
    }
}

