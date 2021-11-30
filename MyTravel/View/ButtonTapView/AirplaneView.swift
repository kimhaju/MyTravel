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
            
            Image(item.image).resizable().frame(width: 30.0, height: 30.0).cornerRadius(10)
            
            HStack{
                VStack(alignment: .leading){
                    Text(item.airplane)
                    Text("\(item.departure)~\(item.arrive)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading){
                    Text("운행 요일: \(item.week)").foregroundColor(Color.gray).font(.system(size: 15))
                    Text("출발지: \(item.starting)").foregroundColor(Color.gray).font(.system(size: 15))
                }
            }
            
        }
        .navigationTitle("국내선 비행기")
    }
}

struct AirplaneView_Previews: PreviewProvider {
    static var previews: some View {
        AirplaneView()
    }
}
