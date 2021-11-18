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
    
    @State private var error : String = ""
    @State private var showingAlert = false
    //->경고 제목
    @State private var alertTitle: String = "로그인에 문제가 생겼습니다...😔"
    
    //->회원가입하는데 있어서 에러를 체크 받을 메서드
    //->사용자가 위와 같은 정보를 제공했는지 확인
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty {
            
            return "비밀번호, 아이디를 다시 확인해주세요!"
        }
        return nil
    }
    
    // MARK: -helper
    //->요것의 용도: 회원가입이 완료되면 창을 초기화
    func clear() {
        self.email = ""
        self.password = ""
    }
    
    func loggedIn() {
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
        
        AuthService.signIn(email: email, password: password, onSuccess: { user in
            self.clear()
        }){ errorMessage in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
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
                
                Button(action: {loggedIn()}){
                    Text("Login").font(.title).modifier(ButtonModifier())
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
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
