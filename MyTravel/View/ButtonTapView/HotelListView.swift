//
//  HotelListView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct HotelListView: View {
    let hotels: [HotelModel] = Bundle.main.decodeHotel("hotelReserve.json")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                ForEach(self.hotels){ item in 
                    HotelCellView(hotelModel: item)
                }
            }.padding()
        }.background(Color.orange).edgesIgnoringSafeArea(.all)
    }
}

struct HotelCellView: View {
    var hotelModel : HotelModel
    @EnvironmentObject var userSession: SessionStore
    @Namespace var animation
    @State var show = false
    
    var body: some View {
        VStack{
            
            WebImage(url: hotelModel.image).resizable().frame(height: 270)
            
            HStack{
                VStack(alignment: .leading){
                    Text(hotelModel.hotel_name)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text(hotelModel.hotel_locate)
                        .fontWeight(.heavy)
                        .font(.body)
                }
                Spacer()
                
                Button(action: {
                    self.show.toggle()
                }){
                    Image(systemName: "arrow.right")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(14)
                }.background(Color.orange)
                .clipShape(Circle())
                
            }.padding(.horizontal)
            .padding(.bottom,6)
            
        }.background(Color.white)
        .cornerRadius(20)
        .sheet(isPresented: self.$show){
            DetailHotelView(hotelItem: hotelModel, animation: animation, user: self.userSession.session, show: $show)
        }
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}
