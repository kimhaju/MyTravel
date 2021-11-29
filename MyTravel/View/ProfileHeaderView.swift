//
//  ProfileViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/09.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeaderView: View {
    var user: User?
    @EnvironmentObject var userSession: SessionStore
    var body: some View {
        if(userSession.session != nil){
            VStack(alignment: .leading){
                HStack {
                    Button(action: {}, label: {
                        NavigationLink(
                            destination: ProfileView()){
                            Image(systemName: "line.horizontal.3.decrease").resizable().frame(width: 24, height: 24)
                        }
                    })
                    
                    Spacer()
                    //->여기에 입력한 데이터 정보 셋팅
                    Text(user?.country ?? "로딩중").font(.system(.headline, design: .rounded))
                    Text("seoul").fontWeight(.ultraLight)
                    Spacer()
                    
                    //->유저 프로파일 사진
                    WebImage(url: URL(string: user?.profileImageURL ?? "https://cdn.pixabay.com/photo/2016/11/29/08/43/blank-1868502_1280.jpg") ).resizable().aspectRatio(contentMode: .fill).frame(width: 36, height: 36).clipShape(Circle())
                }
                // MARK: - profile, search
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text("환영합니다!").font(.largeTitle)
                        Text(user?.username ?? "로딩중").font(.title).fontWeight(.heavy)
                    }
                    Text("여행을 떠나볼까요?").font(.subheadline).fontWeight(.light)
                }
            }.foregroundColor(Color(.systemIndigo))
        }else {
            LoginView()
        }
    }
}


