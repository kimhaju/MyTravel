//
//  DetailHotelView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/26.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct DetailHotelView: View {
    @State private var gridLayout : [GridItem] = [GridItem()]
    var hotelItem : HotelModel
    var animation : Namespace.ID
    var user : User?
    @Binding var show : Bool
    @State private var index = 1
    @State private var wakeUp = Date()
    //->아이템 추가시 안내 알림
    @State private var successAlert = false
    
    var body: some View {
            ScrollView {
                VStack{
                    VStack{
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                            WebImage(url: hotelItem.image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 330)
                                .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            
                            HStack{
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()){show.toggle()}
                                    
                                }) {
                                    
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                Spacer()

                                Button(action: {}, label: {
                                    Image(systemName: "heart")
                                        .foregroundColor(.pink)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                })
                            }
                            .padding()
                            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                        }
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(sampleHotels) { hotels in
                                Image(hotels.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(maxHeight: 150)
                                    .cornerRadius(10)
                            }
                        }.frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeIn)
                        .padding(.all,10)
                        
                        HStack(alignment: .top){
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text(hotelItem.hotel_name)
                                    .font(.title)
                                    .foregroundColor(Color.orange)
                                    .fontWeight(.bold)
                                    .matchedGeometryEffect(id: hotelItem.hotel_name, in: animation)
                                
                                HStack(spacing: 5){
                                    Image("locate")
                                    Text(hotelItem.hotel_locate)
                                        .foregroundColor(.black)
                                        .frame(width: 50)
                                        .matchedGeometryEffect(id: hotelItem.hotel_locate, in: animation)
                                    
                                    HStack(spacing: 5){
                                        
                                        ForEach(1...5, id: \.self){ index in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(index <= Int(hotelItem.hotel_ratings) ?? 0 ? Color.orange : .gray)
                                        }
                                    }
                                }
                            }
                            Spacer(minLength: 0)
                        }
                        .padding()
                        .padding(.bottom)
                    }
                    .background(Color.white)
                    .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))

                    Spacer(minLength: 0)
                }
                .background(Color.white)
                
                VStack(alignment: .leading, spacing: 15){
                    Text("호텔 체크인 시간 \(hotelItem.check_in)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                    
                    Text("인원")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)

                    Text("같이 갈 인원을 선택하세요.")
                    
                    HStack(spacing: 15){

                        ForEach(1...6,id: \.self){i in

                            Button(action: {index = i}) {

                                Text("\(i)")
                                    .fontWeight(.bold)
                                    .foregroundColor(index == i ? .white : .orange)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color("Color").opacity(index == i ? 1 : 0.07))
                                    .cornerRadius(4)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    
                    DatePicker("가는 날짜: ", selection: $wakeUp, in: Date()...).padding().foregroundColor(Color.orange)
                    
                    Text("설명")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .padding(.top,10)
                    
                    Text(hotelItem.details).multilineTextAlignment(.leading)
                    
                    Spacer(minLength: 0)
                    
                    HStack{
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            let db = Firestore.firestore()
                            
                            db.collection("wishlist").document().setData(
                                ["user_id": user!.uid,
                                 "wish_address": self.hotelItem.hotel_locate,
                                 "wish_date": wakeUp,
                                 "wish_people": index,
                                 "wish_price": "50000",
                                 "wish_image": "\(self.hotelItem.image)",
                                 "wish_details": self.hotelItem.details,
                                 "wish_name": self.hotelItem.hotel_name
                                ]) { error in
                                
                                if error != nil {
                                    print("추가에 문제가 생김:  \(error!.localizedDescription)")
                                    return
                                }
                                self.successAlert = true
                               
                            }
                            
                        }){
                            Text("예약하기")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 100)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        }
                        .alert(isPresented: $successAlert){
                            Alert(title: Text("예약"), message: Text("\(hotelItem.hotel_name) 예약에 성공하셨습니다!"), dismissButton: .default(Text("x")))
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                }
                .padding([.horizontal,.top])
            }
    }
}


// MARK: - 호텔 이미지 모델 
struct HotelImage: Identifiable {
    var id = UUID()
    var image: String
    var hotelPhotos: [Photo] = []
}

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let sampleHotels: [HotelImage] = {
    
    var hotels = (1...6).map {HotelImage(image: "hotel-\($0)")}
    
    for index in hotels.indices {
        let randomNumber = Int.random(in: (2...11))
        hotels[index].hotelPhotos = (1...randomNumber).map {(Photo(name: "hotel-\($0)"))}
    }
    
    return hotels
    
}()
