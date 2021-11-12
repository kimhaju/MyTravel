//
//  MainTabView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/12.
//

import SwiftUI

    // MARK: - 탭바 셋팅
    struct MainTabView: View {
        
        @State var tab = "home"
        
        var body: some View{
            VStack(spacing: 0){
                Spacer()
                
                HStack(spacing: 0){
                    TabButton(title: "house.fill", tab: $tab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "calendar.badge.plus", tab: $tab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "heart.fill", tab: $tab)
                    
                    //->사이즈 조정
                }.padding(.top).padding(.bottom,UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 15 :
                                            UIApplication.shared.windows.first!.safeAreaInsets.bottom )
                .edgesIgnoringSafeArea(.all)
                .background(Color.blue).edgesIgnoringSafeArea(.all)
                
            }
        }
    }

    // MARK: -TabButton
    struct TabButton: View {
        
        var title: String
        @Binding var tab: String
   
        var body: some View {
            Button(action: {tab = title}){
                Image(systemName: title).renderingMode(.original).foregroundColor(tab == title ? .white : .gray).padding(.vertical,10).padding(.horizontal).background(Color.blue.opacity(tab == title ? 1 : 0)).clipShape(Capsule())
            }
        }
    }


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
       MainTabView()
    }
}
