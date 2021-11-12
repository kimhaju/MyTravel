//
//  ContentView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/04.
//

import SwiftUI


struct ContentView: View {
   
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    var body: some View {
        Group {
            if(session.session != nil){
                HomeView()
            }else {
                LoginView()
            }
        }.onAppear(perform: listen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
