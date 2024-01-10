//
//  taskModel.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import Foundation

struct TaskModel: Codable {
    var id: Int
    var title: String
    var description: String
    var priority: Int
    var due_date: Date
    var alloc_time: Double
    var isCompleted: Bool
    var isArchived: Bool
}
