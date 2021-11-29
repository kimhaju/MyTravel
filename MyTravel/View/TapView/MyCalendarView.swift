//
//  MyCalendarView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/12.
//

import SwiftUI

struct MyCalendarView: View {
    
    @State var currnetDate: Date = Date()
    
    var body: some View {
        //->여기에 데이트 피커
        ScrollView{
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currnetDate)
            }
            
        }
    }
}

struct MyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView()
    }
}
