//
//  ProfileSettingViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/11.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileSettingView: View {
    var user: User?
    @EnvironmentObject var userSession: SessionStore
    var body: some View {
        VStack{
            if(userSession.session != nil){
                
                if user != nil {
                    WebImage(url: URL(string: user!.profileImageURL)!).resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                    Spacer()
                } else {
                    Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                    Spacer()
                }
                VStack{
                    Text("이메일 주소: \(user!.email)").fontWeight(.bold).font(.system(size: 20)).padding()
                    Text("이름:\(user!.username)").fontWeight(.bold).font(.system(size: 20)).padding()
                    Text("국가:\(user!.country)").fontWeight(.bold).font(.system(size: 20)).padding()
                    Spacer()
                }.padding()
                VStack{
                    Button(action: userSession.logout){
                        Text("logout").font(.headline)
                    }
                }
                VStack {
                    Text("edit profile").font(.title3)
                }
                
            }else {
                LoginView()
            }
        }
            
    }
}

