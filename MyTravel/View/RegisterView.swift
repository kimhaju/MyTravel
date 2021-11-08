//
//  RegisterView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/05.
//

import SwiftUI

struct RegisterView: View {
    
// MARK: - properties
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var country: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error : String = ""
    @State private var showingAlert = false
    //->경고 제목
    @State private var alertTitle: String = "회원가입에 문제가 생겼습니다...😔"
    
    
    // MARK: - register func 
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        profileImage = inputImage
    }
    
    //->회원가입하는데 있어서 에러를 체크 받을 메서드
    //->사용자가 위와 같은 정보를 제공했는지 확인
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty || username.trimmingCharacters(in: .whitespaces).isEmpty || country.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty{
            
            return "모든 정보를 입력해주세요!"
        }
        return nil
    }
    
    //->요것의 용도: 회원가입이 완료되면 창을 초기화 
    func clear() {
        self.email = ""
        self.username = ""
        self.password = ""
        self.country = ""
    }
    
    func registerUp() {
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
        
        AuthService.signUp(username: username, email: email, password: password, country: country, imageData: imageData, onSuccess: { user in
            self.clear()
        }){ errorMessage in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    // MARK: - registerView
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5) {
                Group {
                    if profileImage != nil {
                        profileImage!.resizable().clipShape(Circle()).frame(width: 150, height: 150).padding(.top, 20).onTapGesture {
                            self.showActionSheet = true
                        }
                    }else {
                        Image(systemName: "person.crop.circle.badge.plus").resizable().frame(width: 175, height: 150).padding(.top, 20).foregroundColor(.gray).onTapGesture {
                            self.showActionSheet = true
                            
                        }
                    }
                }
                VStack(alignment: .leading){
                    Text("Register page").font(.system(size: 32, weight: .heavy))
                }
                
                Group {
                    FormField(value: $email, icon: "envelope.fill", placeholder: "이메일")
                    
                    FormField(value: $password, icon: "lock.fill", placeholder: "비밀번호", isSecure: true)
                    
                    FormField(value: $country, icon: "network", placeholder: "국가")
                    
                    FormField(value: $username, icon: "person.circle.fill", placeholder: "이름")
                }
                
                Button(action: {registerUp()}){
                    Text("Register").font(.title).modifier(ButtonModifier())
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }.padding()
                
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showImagePicker, imageData: self.$imageData)
            }.actionSheet(isPresented: $showActionSheet){
                ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
                    
                    self.sourceType = .photoLibrary
                    self.showImagePicker = true
                    
                }, .default(Text("Take a photo")){
                    self.sourceType = .camera
                    self.showImagePicker = true
                    
                }, .cancel()
                
                ])
            }
        }
    }
}

// MARK: - register preview
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
