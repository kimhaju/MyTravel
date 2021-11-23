//
//  AirplaneView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct AirplaneView: View {
    
    let airplane: [AirplaneModel] = Bundle.main.decode("airplaneTime.json")
    var body: some View {
        
        List(airplane) { item in
            VStack{
                HStack{
                    Image(item.image).resizable().frame(width: 20, height: 20)
                    Text(item.airplane).fontWeight(.bold)
                    Text("출발지: \(item.starting)").font(.footnote)
                }
                
                HStack{
                    VStack(spacing: 8){
                        Text("시간: \(item.departure) ~ \(item.arrive)")
                    }
                    Text("운행 요일: \(item.week)")
                }
            }
            
        }.navigationTitle("국내 비행기 시간표")
        
    }
}

struct AirplaneView_Previews: PreviewProvider {
    static var previews: some View {
        AirplaneView()
    }
}
