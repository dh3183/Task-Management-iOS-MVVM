//
//  TaskViewModel.swift
//  TaskManagement
//
//  Created by 한빈 on 2023/02/16.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var storedTasks: [Task] = [
        
        Task(taskTitle: "미팅", taskDescription: "오늘의 팀 작업에 대해 논의", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "아이콘 수정", taskDescription: "다음 주 팀 작업의 아이콘 수정", taskDate:.init(timeIntervalSince1970: 1641649017)),
        Task(taskTitle: "프로토타입", taskDescription: "프로토타입 제작 및 전달", taskDate: .init(timeIntervalSince1970: 1641652697)),
        Task(taskTitle: "코드 체크", taskDescription: "코드를 한번 더 확인", taskDate: .init(timeIntervalSince1970: 1641656297)),
        Task(taskTitle: "팀 회식", taskDescription: "팀원들과 함께 회식", taskDate: .init(timeIntervalSince1970: 1641661897)),
        Task(taskTitle: "클라이언트 미팅", taskDescription: "클라이언트에게 프로젝트 설명", taskDate: .init(timeIntervalSince1970: 1641641897)),
        Task(taskTitle: "추 후 프로젝트", taskDescription: "팀과 다음 프로젝트에 대해 논의", taskDate: .init(timeIntervalSince1970: 1641677897)),
        Task(taskTitle: "앱 제안", taskDescription: "다음 앱 제안을 위해 클라이언트를 만남", taskDate: .init(timeIntervalSince1970: 1641681497)),
    ]
    
    // MARK: Current Week Days
    @Published var currentWeek: [Date] = []
    
    // MARK: Intializing
    init() {
        fetchCurrentWeek()
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
}
