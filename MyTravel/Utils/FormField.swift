//
//  FormField.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/04.
//

import SwiftUI

//->로그인 페이지에 전달할 양식필드
struct FormField: View {
    
    @Binding var value: String
    
    var icon: String //->아이콘을 문자열 필드로 저장
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: icon).padding()
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    }else {
                        TextField(placeholder, text: $value)
                    }
                }.font(Font.system(size: 20, design: .monospaced))
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

            }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4)).padding()
        }
    }
}

