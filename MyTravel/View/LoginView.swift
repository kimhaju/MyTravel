//
//  LoginView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/04.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "camera.fill.badge.ellipsis").font(.system(size: 60, weight: .black, design: .monospaced))
                
                VStack(alignment: .leading){
                    Text("Login page").font(.system(size: 32, weight: .heavy))
                    
                    Text("여행을 떠나볼까요?").font(.system(size: 16, weight: .light))
                }
                
                FormField(value: $email, icon: "envelope.fill", placeholder: "이메일")
                
                FormField(value: $password, icon: "lock.fill", placeholder: "비밀번호", isSecure: true)
                
                Button(action: {}){
                    Text("Login").font(.title).modifier(ButtonModifier())
                }.padding()
                
                HStack {
                    NavigationLink(
                        destination: RegisterView()) {
                    Text("계정이 없나요? 지금 계정을 만들어보세요!").font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
