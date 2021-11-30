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
    @State private var successAlert = false
  
    //->11,23 위시 리스트 조회 가능 해당 유저 아이디로만 조회 가능하도록 설정
    //->근데 솔직히 디자인 구림 디자인 이쁘게 해주자 
    
    var body: some View {
        NavigationView {
            List(wishData.wishItems) { item in
                    HStack{
                        VStack (alignment: .leading){
                            WebImage(url: URL(string: item.wish_image)).resizable().frame(width: 100, height: 100)
                        }
                        VStack(alignment: .leading){
                            Text(item.wish_name).font(.title2)
                            Text("출발 일정:\(item.dateString)").fontWeight(.light).padding(.top,3)
                            Text(item.wish_details).font(.footnote).lineLimit(2).padding(.top,3)
                            
                            Spacer()
                        }
                        
                            
                        Button(action: {
                            self.wishData.deleteWishItem(deleteId: item.id)
                            self.successAlert = true
                        }){
                            Image(systemName: "trash").resizable().frame(width: 20, height: 20)
                        }
                        .alert(isPresented: $successAlert){
                            Alert(title: Text("\(item.wish_name)"), message: Text(" 예약을 정말 취소하시겠습니까?"), dismissButton: .default(Text("x")))
                        }
                        
                    }
            }.navigationBarTitle("\(user!.username) 님의 예약리스트")
            .onAppear(){
                self.wishData.getWishItem(userId: user!.uid)
            }
        }
    }
}



