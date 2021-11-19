//
//  TravelScrollView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/16.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
import Introspect

//->11.18일 왜 이 뷰를 다른데서 못불러오나 했는데 뷰가 빠져서 그랬었다 
struct TravelScrollView: View {
    @State var uiTabarController: UITabBarController?
    @ObservedObject var homeModel = HomeViewModel()
   @State public var selection: Int = 0
    
    
    //->11월 18일 문제 해결. 조회는 완료 되었으나 (읽기 기록이 파이어베이스에 남았음)
    // 텍스트 표현쪽에 문제가 생겨서 이랬던 거였음.
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 25){
                ForEach(homeModel.travelItems){ item in
                    NavigationLink(
                        destination: DetailTravelPageView(selection: self.$selection, homeModel: homeModel)){

                        WebImage(url: URL(string: item.item_image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height:250)

                    }.buttonStyle(PlainButtonStyle())

                    HStack(spacing: 8) {
                        Text(item.item_name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Spacer(minLength: 0)

                        ForEach(1...5, id: \.self){ index in
                            Image(systemName: "star.fill")
                                .foregroundColor(index <= Int(item.item_ratings) ?? 0 ? Color.pink : .gray)
                        }
                    }

                    HStack{
                        Text(item.item_details)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(2)

                        Spacer(minLength: 0)
                    }
                }
              }.navigationTitle("봄에 떠나기 좋은 여행")
               .onAppear(){
                self.homeModel.travelFetchData()
            }
            
        })
    }
}



//

//
