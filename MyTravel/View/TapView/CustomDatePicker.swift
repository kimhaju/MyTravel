//
//  CustomDatePicker.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/29.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
   
    var body: some View {
        
        VStack(spacing: 35) {
            
            // 날짜 표시
            let days: [String] = ["일","월","화","수","목","금","토"]
            HStack(spacing:20) {
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left").font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right").font(.title2)
                }
            }.padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days,id: \.self){ day in
                    
                    Text(day).font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                
                ForEach(extractDate()){ value in
                    
                    CardView(value: value).background(
                        Capsule().fill(Color("Pink")).padding(.horizontal,8)
                            .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                    
                    )
                    .onTapGesture {
                        currentDate = value.date
                    }
                }
            }
            
            VStack(spacing: 15){
                Text("Tasks").font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical,20)
                
                if let task = tasks.first(where: { task -> Bool in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    
                    ForEach(task.task){ task in
                        VStack(alignment: .leading, spacing: 10){
                            Text(task.time.addingTimeInterval(TimeInterval(CGFloat.random(in: 0...5000))), style: .time)
                            
                            Text(task.title).font(.title2)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color("Purple").opacity(0.5).cornerRadius(10)
                        )
                        
                        
                    }
                    
                }else {
                    Text("일정이 없습니다.")
                }
            }
            .padding()
            
        }
        .onChange(of: currentMonth) { newValue in
            // 업데이트 달
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        
        VStack{
            if value.day != -1{
               
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                    
                }){
                    Text("\(value.day)")
                        .font(.title)
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle().fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("Pink"))
                        .frame(width: 8, height: 8)
                    
                }else {
                    Text("\(value.day)").font(.title3)
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical,8)
        .frame(height: 60, alignment: .top)
    }
    
    //->날짜 체크
    func isSameDay(date1: Date, date2: Date)->Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate() -> [String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        //->가장 최근의 날짜를 선택
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth ,to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    
    func extractDate() -> [DateValue]  {
        
        let calendar = Calendar.current
        
        //->가장 최근의 날짜를 선택
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //->날짜 선택
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

// MARK: -달력 날짜 확장
extension Date {
    
    func getAllDates() -> [Date] {
    
        let calendar = Calendar.current
        
        //->시작하는 날짜 설정
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        //시작 하는 날짜를 1로 시작하게 설정
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
    
}

//struct CustomDatePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomDatePicker()
//    }
//}
