//
//  HomeView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/08.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @EnvironmentObject var session: SessionStore
//    @StateObject var homeModel = HomeViewModel()
    @ObservedObject var homeModel = HomeViewModel()
    var body: some View {
        // MARK: - header
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ProfileHeaderViewModel(user: self.session.session)
                    //->검색창
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass").foregroundColor(Color(UIColor.systemIndigo)).padding()
                            
                            TextField("여행지를 검색해보세요!", text: $homeModel.search)
                            
                            if homeModel.search != ""{
                                Button(action: {}, label: {
                                    Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 10, height: 10).padding()
                                })
                            }
                            Spacer()
                            
                            Divider().frame(height: 24)
                        }.foregroundColor(Color.secondary.opacity(0.5)).background(Color.gray.opacity(0.1)).cornerRadius(80).shadow(radius: 1).padding()
                    }
                    // MARK: - travel button
                    
                    TravelButtonView()
                    
                    // MARK: - trips
                    PackageView()
                }
            }
        }
    }
}

// MARK: - 나중에 뺄거
//->굴곡주기
struct Curves: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath (roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


