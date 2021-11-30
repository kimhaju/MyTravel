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
    
        TravelTask(title: "전주 패키지 예약")
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        
        TravelTask(title: "미향 호텔 예약")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        
        TravelTask(title: "전주패키지 예약")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        
        TravelTask(title: "자전거 여행 예약")
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task: [
        
        TravelTask(title: "벚꽃 여행 패키지 예약")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        
        TravelTask(title: "페이 호텔 예약")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        
        TravelTask(title: "낙동강 자전거길 예약")
    ], taskDate: getSampleDate(offset: -20)),
]
