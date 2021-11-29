//
//  TravelTask.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/29.
//

import Foundation

//->여행 일정
struct TravelTask: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [TravelTask]
    var taskDate: Date
}

// sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
    
        TravelTask(title: "Talk to iJustine"),
        TravelTask(title: "iPhone 13 Great Design Change😂"),
        TravelTask(title: "Nothing Much Workout !!!")
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        
        TravelTask(title: "Talk to Jenna Ezarik")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        
        TravelTask(title: "Meeting with Tim Cook")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        
        TravelTask(title: "Next Version of SwiftUI")
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task: [
        
        TravelTask(title: "Nothing Much Workout !!!")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        
        TravelTask(title: "iPhone 13 Great Design Change😂")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        
        TravelTask(title: "Kavsoft App Updates....")
    ], taskDate: getSampleDate(offset: -20)),
]
