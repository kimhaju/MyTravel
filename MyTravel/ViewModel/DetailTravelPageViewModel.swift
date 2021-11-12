//
//  DetailTravelPageViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/09.
//

import SwiftUI

struct DetailTravelPageViewModel: View {
    var body: some View {
        VStack {
            Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 350,height: 450)
        }.clipShape(Curves(corner: .bottomLeft, radius: 35)).clipShape(Curves(corner: .bottomRight, radius: 35)).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)

        VStack(alignment: .leading, spacing: 8){
            HStack {
                Text("waterfall").font(.largeTitle).fontWeight(.heavy)
                Text("jeju").font(.largeTitle).fontWeight(.ultraLight).foregroundColor(.secondary)
            }
            //->별점 페이지
            HStack {
                Image(systemName: "star.fill")
                Text("4.7").font(.headline).fontWeight(.bold)
            }
            
            HStack(spacing: 15){
                VStack(spacing: 15){
                    ZStack {
                        Image("plane").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                        
                        VStack{
                            Spacer()
                            Text("Tickets").fontWeight(.heavy)
                        }.padding()
                    }.frame(width: 165, height: 165).cornerRadius(20)
                    
                    ZStack {
                        Image("map").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                        
                        VStack{
                            Spacer()
                            Text("Hotels").fontWeight(.heavy)
                        }.padding()
                    }.frame(width: 165, height: 165).cornerRadius(20)
                }
                VStack (spacing: 15){
                    ZStack {
                        Image("place").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                        
                        VStack{
                            Spacer()
                            Text("places").fontWeight(.heavy)
                        }.padding()
                    }.frame(width: 165, height: 165).cornerRadius(20)
                    
                    ZStack {
                        Image("cloud").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
                        
                        VStack{
                            Spacer()
                            Text("weather").fontWeight(.heavy)
                        }.padding()
                    }.frame(width: 165, height: 165).cornerRadius(20)
                }
            }.padding(.vertical)
        }.padding()
        Spacer()
    }
}

struct DetailTravelPageViewModel_Previews: PreviewProvider {
    static var previews: some View {
        DetailTravelPageViewModel()
    }
}
