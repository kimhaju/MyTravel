//
//  TravelButtonViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/09.
//

import SwiftUI

struct TravelButtonViewModel: View {
    var body: some View {
        HStack {
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Image(systemName: "airplane").foregroundColor(.white).padding(.all, 18).background(Color.blue.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                }
                Text("Flights").font(.footnote).bold()
            }
            Spacer()
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Image(systemName: "bed.double.fill").foregroundColor(.white).padding(.all, 18).background(Color.orange.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                }
                Text("Hotels").font(.footnote).bold()
            }
            Spacer()
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Image(systemName: "location.fill").foregroundColor(.white).padding(.all, 18).background(Color.purple.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                }
                Text("places").font(.footnote).bold()
            }
            Spacer()
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Image(systemName: "rectangle.grid.2x2.fill").foregroundColor(.white).padding(.all, 18).background(Color.red.opacity(0.8)).cornerRadius(12).shadow(radius: 2)
                }
                Text("more").font(.footnote).bold()
            }
        }.padding()
        
        Spacer()
    }
}

struct TravelButtonViewModel_Previews: PreviewProvider {
    static var previews: some View {
        TravelButtonViewModel()
    }
}
