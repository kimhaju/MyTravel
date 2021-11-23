//
//  MoreView.swift
//  MyTravel
//
//  Created by haju Kim on 2021/11/15.
//

import SwiftUI
import CoreLocation

struct MoreView: View {
    
    @StateObject var travelButtonModel = TravelButtonViewModel()
    
    var body: some View {
        switch travelButtonModel.authorizationStatus {
                case .notDetermined:
                    AnyView(RequestLocationView())
                        .environmentObject(travelButtonModel)
                case .restricted:
                    ErrorView(errorText: "Location use is restricted.")
                case .denied:
                    ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
                case .authorizedAlways, .authorizedWhenInUse:
                    TrackingView()
                        .environmentObject(travelButtonModel)
                default:
                    Text("Unexpected status")
                }
            
    }
}

struct RequestLocationView: View {
    @EnvironmentObject var travelButtonModel : TravelButtonViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "location.circle")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Button(action: {
                print("allowing perms")
            }, label: {
                Label("Allow tracking", systemImage: "location")
            })
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("We need your permission to track you.")
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                    .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(errorText)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
    }
}

//->내 자세한 위치 11.15일자 추가할내용. 이 내용을 나중에 로케이션 뷰로 옮기기
struct TrackingView: View {
    
    @EnvironmentObject var travelButtonModel : TravelButtonViewModel
    
    var body: some View {
           VStack {
               VStack {
                   Text("Latitude: ")
                Text(String(coordinate?.latitude ?? 0))
               }.padding()
            
            VStack {
                Text("Longitude: ")
             Text(String(coordinate?.longitude ?? 0))
            }.padding()
            
            VStack {
                Text("Altitude: ")
             Text(String(travelButtonModel.lastSeenLocation?.altitude ?? 0))
            }.padding()
            
            VStack {
                Text("Speed: ")
             Text(String(travelButtonModel.lastSeenLocation?.speed ?? 0))
            }.padding()
            
            VStack {
                Text("Country: ")
             Text(travelButtonModel.currentPlacemark?.country ?? "")
            }.padding()
            
            VStack {
                Text("City: ")
             Text(travelButtonModel.currentPlacemark?.administrativeArea ?? "")
            }.padding()
            
           }
       }
       
       var coordinate: CLLocationCoordinate2D? {
        travelButtonModel.lastSeenLocation?.coordinate
       }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
