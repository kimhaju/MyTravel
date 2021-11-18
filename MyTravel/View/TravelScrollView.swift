//
//  TravelScrollView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/16.
//

import SwiftUI
import Firebase

//->11.18일 왜 이 뷰를 다른데서 못불러오나 했는데 뷰가 빠져서 그랬었다 
struct TravelScrollView: View {
    @StateObject var homeModel = HomeViewModel()
    
    //->11월 18일 문제 해결. 조회는 완료 되었으나 (읽기 기록이 파이어베이스에 남았음)
    // 텍스트 표현쪽에 문제가 생겨서 이랬던 거였음.
       var body: some View {
            List (homeModel.travelItems) { items in
                VStack(alignment: .leading){
                    Text(items.item_address)
                }
            }
            .onAppear(){
                self.homeModel.travelFetchData()
            }
        }
    
}



