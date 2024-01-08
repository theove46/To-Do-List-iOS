//
//  DummyTaskModelList.swift
//  To Do List Project
//
//  Created by BS1098 on 3/1/24.
//

import Foundation

let task1 = TaskModel(
    id: 1,
    title: "Complete ToDo App",
    description: "Build a ToDo list app with Swift",
    priority: 1,
    due_date: Date(timeIntervalSinceNow: 86400),
    alloc_time: 2.5,
    isCompleted: false, isArchived: false
)

let task2 = TaskModel(
    id: 2,
    title: "Study Swift",
    description: "Learn the basics of Swift programming language",
    priority: 2,
    due_date: Date(timeIntervalSinceNow: 172800),
    alloc_time: 1.5,
    isCompleted: false,
    isArchived: false
)

let task3 = TaskModel(
    id: 3,
    title: "Exercise",
    description: "Go for a 30-minute jog",
    priority: 2,
    due_date: Date(timeIntervalSinceNow: 259200),
    alloc_time: 1,
    isCompleted: false,
    isArchived: false
)

let task4 = TaskModel(
    id: 4,
    title: "Read a Book",
    description: "Finish reading 'Swift Programming for Beginners'",
    priority: 2,
    due_date: Date(timeIntervalSinceNow: 345600),
    alloc_time: 1.5,
    isCompleted: false,
    isArchived: false
)

let task5 = TaskModel(
    id: 5,
    title: "Work on Project",
    description: "Complete project tasks and meet deadlines",
    priority: 1,
    due_date: Date(timeIntervalSinceNow: 432000),
    alloc_time: 3.0,
    isCompleted: false,
    isArchived: false
)

let tasksArray = [task1, task2, task3, task4, task5]

