//
//  DetailTravelPageViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/09.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct DetailTravelPageView: View {
    var item : TravelItemModel
    var animation : Namespace.ID
    @Binding var show : Bool
    @State var index = 1
    @State var wakeUp = Date()
    
    
    var body: some View {
        //->발견한 에러: 11월 22일-> 스크롤뷰 설정할때 방향을 설정하려면 자식뷰를 하나로 통일해야 한다 vsStack 하던지 HsStack하던지
        ScrollView() {

            VStack{
                VStack{
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                        WebImage(url: URL(string: item.item_image))
                            .resizable()
                            .frame(height: 330)
                            .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                            .matchedGeometryEffect(id: item.item_image, in: animation)

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

                    HStack(alignment: .top){

                        VStack(alignment: .leading, spacing: 12){

                            Text(item.item_name)
                                .font(.title)
                                .foregroundColor(Color.pink)
                                .fontWeight(.bold)
                                .matchedGeometryEffect(id: item.item_name, in: animation)

                            HStack(spacing: 5) {

                                Image("locate")
                                Text(item.item_address)
                                    .foregroundColor(.black)
                                    .frame(width: 120)
                                    .matchedGeometryEffect(id: item.item_address, in: animation)
  
                                HStack(spacing: 5){
                                    
                                    ForEach(1...5, id: \.self){ index in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(index <= Int(item.item_ratings) ?? 0 ? Color.pink : .gray)
                                    }
                                    
                                }
                            }
                        }

                        Spacer(minLength: 0)
                        Text(item.item_price)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.pink)

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
                Text("인원")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)

                Text("같이 갈 인원을 선택하세요.")

                HStack(spacing: 15){

                    ForEach(1...6,id: \.self){i in

                        Button(action: {index = i}) {

                            Text("\(i)")
                                .fontWeight(.bold)
                                .foregroundColor(index == i ? .white : .pink)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color("Color").opacity(index == i ? 1 : 0.07))
                                .cornerRadius(4)
                        }
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top)

                DatePicker("가는 날짜: ", selection: $wakeUp, in: Date()...).padding().foregroundColor(Color.pink)

                Text("설명")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                    .padding(.top,10)

                Text(item.item_details).multilineTextAlignment(.leading)

                Spacer(minLength: 0)

                HStack {
                    Spacer(minLength: 0)

                    Button(action: {}){
                        Text("예약하기")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.pink)
                            .clipShape(Capsule())
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

struct RoundedShape : Shape {
    var corners : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}

