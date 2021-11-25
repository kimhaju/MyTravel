//
//  PackageView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/17.
//

import SwiftUI

struct PackageView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("tema").font(.largeTitle)
                Text("trips").font(.title).fontWeight(.heavy)
                Spacer()
            }.padding(.vertical)
            .foregroundColor(Color(UIColor.systemIndigo)).edgesIgnoringSafeArea(.bottom)
            
            TemaSelectedView()
            
           
            //->11.23 에러 고침 인바이런 먼트 오브젝트를 받아들일수 있게 작업을 미리 해줘야 했었음. 감사합니다 스택 오버 플로우 스크롤 뷰에 인바리언 먼트 오브젝트 타입을 추가해줌 !
            
            //->여기는 따로 뷰로 빼서 선택할시 화면을 전환 시키자
        }
    }
}



//HStack(spacing: 60){
//    Picker("TemaTravel", selection: $selectedTema){
//        ForEach(TemaTravel.allCases){ tema in
//            Text(tema.rawValue.capitalized).tag(tema)
//
//        }
//    }
//}.pickerStyle(SegmentedPickerStyle())
//.padding(.vertical)
