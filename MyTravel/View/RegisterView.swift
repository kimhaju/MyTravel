//
//  RegisterView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/05.
//

import SwiftUI

struct RegisterView: View {
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
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        profileImage = inputImage
    }
    
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
                    
                    FormField(value: $country, icon: "network", placeholder: "국가", isSecure: true)
                    
                    FormField(value: $username, icon: "person.circle.fill", placeholder: "이름", isSecure: true)
                }
                
                Button(action: {}){
                    Text("Register").font(.title).modifier(ButtonModifier())
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
