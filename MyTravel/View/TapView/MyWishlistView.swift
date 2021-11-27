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
                    HStack{
                        VStack (alignment: .leading){
                            WebImage(url: URL(string: item.wish_image)).resizable().frame(width: 70, height: 50)
                            Text(item.wish_name)
                            Text(item.dateString)
                        }
                            
                        Button(action: {
                            self.wishData.deleteWishItem(deleteId: item.id)
                            
                        }){
                            Image(systemName: "trash").resizable().frame(width: 20, height: 20)
                        }
                }
            }.navigationBarTitle("\(user!.username) 님의 위시리스트")
            .onAppear(){
                self.wishData.getWishItem(userId: user!.uid)
            }
        }
    }
}



