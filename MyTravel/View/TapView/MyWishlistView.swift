//
//  MyWishlistView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/12.
//

import SwiftUI

struct MyWishlistView: View {
    @ObservedObject var listData: MyWishlistViewModel
    
    var body: some View {
        VStack{
            Button(action: {
                withAnimation(.easeIn){
                    listData.showlist.toggle()
                }
            }, label: {
                HStack(spacing: 15){
                    Image(systemName: "heart.fill").resizable().frame(width: 20, height: 20)
                    
                    Text("wishList").fontWeight(.bold).foregroundColor(.black)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding()
            })
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                Text("version 0.1").fontWeight(.bold)
            }.padding(10)
        }.frame(width: UIScreen.main.bounds.width / 1.6).background(Color.white)
    }
}

//struct MyWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyWishlistView(listData: <#MyWishlistViewModel#>)
//    }
//}
