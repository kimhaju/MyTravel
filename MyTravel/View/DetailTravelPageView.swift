//
//  DetailTravelPageViewModel.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/09.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct DetailTravelPageView: View {
    
    @Binding var selection: Int
    @ObservedObject var homeModel : HomeViewModel
    
    var body: some View {
        let item = homeModel.travelItems
        VStack{
            VStack{
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    WebImage(url: URL(string: item[selection].item_image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 415,height: 330)
                        .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
                    
                    HStack {
                       
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                       
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "suit.heart")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }.padding()
                // since all edges are ignored....
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            }
            
            HStack(alignment: .top){
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(item[selection].item_name)
                        .font(.title)
                        .foregroundColor(Color.pink)
                        .fontWeight(.bold)
                    
                }
            }
        }
    }
}

struct RoundedShape : Shape {
    
    // for resuable.....
    var corners : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}


//struct DetailTravelPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailTravelPageView(item: )
//    }
//}

//    Image("water").resizable().aspectRatio(contentMode: .fill).frame(width: 350,height: 450)
//}.clipShape(Curves(corner: .bottomLeft, radius: 35)).clipShape(Curves(corner: .bottomRight, radius: 35)).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
//
//VStack(alignment: .leading, spacing: 8){
//    HStack {
//        Text("waterfall").font(.largeTitle).fontWeight(.heavy)
//        Text("jeju").font(.largeTitle).fontWeight(.ultraLight).foregroundColor(.secondary)
//    }
//    //->별점 페이지
//    HStack {
//        Image(systemName: "star.fill")
//        Text("4.7").font(.headline).fontWeight(.bold)
//    }
//
//    HStack(spacing: 15){
//        VStack(spacing: 15){
//            ZStack {
//                Image("plane").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
//
//                VStack{
//                    Spacer()
//                    Text("Tickets").fontWeight(.heavy)
//                }.padding()
//            }.frame(width: 165, height: 165).cornerRadius(20)
//
//            ZStack {
//                Image("map").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
//
//                VStack{
//                    Spacer()
//                    Text("Hotels").fontWeight(.heavy)
//                }.padding()
//            }.frame(width: 165, height: 165).cornerRadius(20)
//        }
//        VStack (spacing: 15){
//            ZStack {
//                Image("place").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
//
//                VStack{
//                    Spacer()
//                    Text("places").fontWeight(.heavy)
//                }.padding()
//            }.frame(width: 165, height: 165).cornerRadius(20)
//
//            ZStack {
//                Image("cloud").resizable().aspectRatio(contentMode: .fill).opacity(0.6)
//
//                VStack{
//                    Spacer()
//                    Text("weather").fontWeight(.heavy)
//                }.padding()
//            }.frame(width: 165, height: 165).cornerRadius(20)
//        }
//    }.padding(.vertical)
//}.padding()
//Spacer()
