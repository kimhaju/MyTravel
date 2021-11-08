//
//  ButtonModifier.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/05.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
   
    func body(content: Content) -> some View {
        
        //->최소 넓이 0, 최고 넓이 끝까지
        content.frame(minWidth: 0, maxWidth: .infinity).frame(height: 20).padding().foregroundColor(.white).font(.system(size: 14, weight: .bold)).background(Color.black).cornerRadius(5.0)
        
    }
}

