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
    @ObservedObject var homeModel : HomeViewModel
    @Binding var selection: Int
    @State var index = 1
    var animation : Namespace.ID
    
    var body: some View {
        let item = homeModel.travelItems
        
        VStack{
            VStack{
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    WebImage(url: URL(string: item[selection].item_image))
                        .resizable()
                        .frame(height: 330)
                        .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                        .matchedGeometryEffect(id: item[selection].item_image, in: animation)
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Image(systemName: "suit.heart")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                }
                
                HStack(alignment: .top){
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(item[selection].item_name)
                            .font(.title)
                            .foregroundColor(Color.pink)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: item[selection].item_name, in: animation)
                        
                    }
                }
            }
            Spacer(minLength: 0)
        }
    }
}


struct RoundedShape : Shape {
    var corners : UIRectCorner

    func path(in rect: CGRect) -> Path {

        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))

        return Path(path.cgPath)
    }
}

//struct BottomView: View {
//     @State var index = 1
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15){
//
//            Text("인원")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(Color("txt"))
//
//            Text("여행 갈 사람들")
//                .font(.caption)
//
//        }
//    }
//}

//VStack{
//    VStack{
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
//            WebImage(url: URL(string: item[selection].item_image))
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height: 330)
//                .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
//
//            HStack {
//
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.black)
//                    .padding()
//                    .background(Color.white)
//                    .clipShape(Circle())
//
//            }
//
//            Spacer()
//
//            Button(action: {}) {
//
//                Image(systemName: "suit.heart")
//                    .foregroundColor(.black)
//                    .padding()
//                    .background(Color.white)
//                    .clipShape(Circle())
//            }
//        }.padding()
//        // since all edges are ignored....
//        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//    }
//
//    HStack(alignment: .top){
//
//        VStack(alignment: .leading, spacing: 12) {
//            Text(item[selection].item_name)
//                .font(.title)
//                .foregroundColor(Color.pink)
//                .fontWeight(.bold)
//
//            HStack(spacing: 10){
//                Image("locate")
//
//                Text(item[selection].item_address)
//                    .foregroundColor(.black)
//
//                HStack(spacing: 5){
//
//                    ForEach(1...5, id: \.self){ index in
//                        Image(systemName: "star.fill")
//                            .foregroundColor(index <= Int(item[selection].item_ratings) ?? 0 ? Color.pink : .gray)
//                    }
//                }
//            }
//            Spacer(minLength: 0)
//
//            Text(item[selection].item_price)
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(Color.pink)
//        }.padding()
//        .padding(.bottom)
//    }
//    .background(Color.white)
//    .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
//
//       VStack(alignment: .leading, spacing: 15){
//
//           Text("인원")
//               .font(.title)
//               .fontWeight(.bold)
//               .foregroundColor(Color("txt"))
//
//           Text("여행 갈 사람들")
//               .font(.caption)
//
//        HStack(spacing: 15) {
//
//            ForEach(1...6, id: \.self){ i in
//
//                Button(action: {index = i}){
//
//                    Text("\(i)")
//                        .fontWeight(.bold)
//                        .foregroundColor(index == i ? .gray : .pink)
//                        .padding(.vertical,10)
//                        .padding(.horizontal)
//                        .background(Color("Color").opacity(index == i ? 1 : 0.07))
//                        .cornerRadius(4)
//                }
//            }
//            Spacer(minLength: 0)
//        }
//        padding(.top)
//
//    }
//}
