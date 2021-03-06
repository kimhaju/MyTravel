//
//  ProfileView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/10.
//

import SwiftUI
import Introspect

struct ProfileView: View {
    //->세션 저장소에 있는 유저 가져오기
    @State var uiTabarController: UITabBarController?
    @EnvironmentObject var userSession: SessionStore
    @State private var selection = 1
    var user: User?
    
    var body: some View {
        VStack{
        }.navigationTitle("Profile")
        
        //->유저 프로파일 이미지
        VStack{
            ProfileSettingView(user: self.userSession.session)
        }.introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            uiTabarController?.tabBar.isHidden = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
