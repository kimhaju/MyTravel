//
//  ContentView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/04.
//

import SwiftUI

struct ContentView: View {
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            FormField(value: $mail, icon: "envelope.fill", placeholder: "이메일")
            FormField(value: $password, icon: "lock.fill", placeholder: "비밀번호", isSecure: true)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
