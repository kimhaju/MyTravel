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
    @EnvironmentObject var homeModel : HomeViewModel
    @Namespace var animation
    @State var show = false
    
    //    @State var showDetails = true
    @State var uiTabarController: UITabBarController?
    //    @State public var selection: Int = 0

    //->11월 18일 문제 해결. 조회는 완료 되었으나 (읽기 기록이 파이어베이스에 남았음)
    // 텍스트 표현쪽에 문제가 생겨서 이랬던 거였음.
    var body: some View {
        
        VStack{
            if self.homeModel.travelItems.count != 0 {
                
                ScrollView {
                    VStack(spacing: 15){
                        ForEach(self.homeModel.travelItems){ item in
                            CellView(travelItem: item)
                        }
                    }.padding()
                }.background(Color.pink).edgesIgnoringSafeArea(.all)
                
            }else {
                Loader()
            }
        }
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            
            
            uiTabarController?.tabBar.isHidden = false
        }
    }
    
}

struct CellView: View {
    var travelItem : TravelItemModel
    @EnvironmentObject var userSession: SessionStore
    @State var show = false
    @Namespace var animation
    
    var body: some View {
        VStack{
            
            AnimatedImage(url: URL(string: travelItem.item_image)).resizable().frame(height: 270)
            
            HStack{
                VStack(alignment: .leading){
                    Text(travelItem.item_name)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text(travelItem.item_price)
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
                }.background(Color.pink)
                .clipShape(Circle())
                
            }.padding(.horizontal)
            .padding(.bottom,6)
            
        }.background(Color.white)
        .cornerRadius(20)
        .sheet(isPresented: self.$show){
//            DetailTravelPageView(item: travelItem, animation: animation, show: $show)
            
            DetailTravelPageView(item: travelItem, animation: animation, user: self.userSession.session, show: $show)
        }
    }
}


//ScrollView(.vertical, showsIndicators: false, content: {
//    VStack(spacing: 25){
//        ForEach(homeModel.travelItems){ item in
//            NavigationLink(
//                destination: DetailTravelPageView(homeModel: homeModel, selection: self.$selection,animation: animation)){
//
//                WebImage(url: URL(string: item.item_image))
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(height:250)
//
//            }.buttonStyle(PlainButtonStyle())
//
//            HStack(spacing: 8) {
//                Text(item.item_name)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Spacer(minLength: 0)
//
//                ForEach(1...5, id: \.self){ index in
//                    Image(systemName: "star.fill")
//                        .foregroundColor(index <= Int(item.item_ratings) ?? 0 ? Color.pink : .gray)
//                }
//            }
//
//            HStack{
//                Text(item.item_details)
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .lineLimit(2)
//
//                Spacer(minLength: 0)
//            }
//        }.navigationTitle("봄 여행")
//    }
//
//})
//
//
