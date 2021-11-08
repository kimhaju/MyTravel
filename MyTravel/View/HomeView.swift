//
//  HomeView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/08.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        VStack{
            Text("Home View")
            Button(action: {session.logout()}){
                Text("로그아웃 피슝").font(.title).modifier(ButtonModifier())
            }.padding()
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
