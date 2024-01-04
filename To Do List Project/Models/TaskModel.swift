//
//  taskModel.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import Foundation

struct TaskModel: Codable {
    let id: Int
    let title: String
    let descriotion: String?
    let priority: Int
    let due_date: Date
    let alloc_time: Double
    let isCompleted: Bool
    let isArchived: Bool
}
