//
//  TaskModel.swift
//  TaskManagement
//
//  Created by 한빈 on 2023/02/16.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
