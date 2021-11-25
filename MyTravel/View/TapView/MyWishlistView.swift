//
//  MyWishlistView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/12.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyWishlistView: View {
    @ObservedObject var wishData = MyWishlistViewModel()
    var user: User?
  
    //->11,23 위시 리스트 조회 가능 해당 유저 아이디로만 조회 가능하도록 설정
    //->근데 솔직히 디자인 구림 디자인 이쁘게 해주자 
    
    var body: some View {
        NavigationView {
            List(wishData.wishItems) { item in
                VStack (alignment: .leading){
                    Text(item.wish_name)
                    Text(item.dateString)
                }
            }.navigationBarTitle("위시리스트")
            .onAppear(){
                self.wishData.getWishItem(userId: user!.uid)
            }
        }
    }
}

//struct MyWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyWishlistView(listData: <#MyWishlistViewModel#>)
//    }
//}

//    Button(action: {
//        withAnimation(.easeIn){
//            listData.showlist.toggle()
//        }
//    }, label: {
//        HStack(spacing: 15){
//            Image(systemName: "heart.fill").resizable().frame(width: 20, height: 20)
//
//            Text("wishList").fontWeight(.bold).foregroundColor(.black)
//
//            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
//        }
//        .padding()
//    })
//
//    Spacer()
//
//    HStack{
//
//        Spacer()
//
//        Text("version 0.1").fontWeight(.bold)
//    }.padding(10)
//}.frame(width: UIScreen.main.bounds.width / 1.6).background(Color.white)
