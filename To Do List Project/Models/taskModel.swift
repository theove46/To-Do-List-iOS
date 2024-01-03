//
//  taskModel.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import Foundation

struct Task: Codable {
    let title: String
    let descriotion: String?
    let priority: Int
    let due_date: Date
    let isCompleted: Bool
    let isArchived: Bool
}
