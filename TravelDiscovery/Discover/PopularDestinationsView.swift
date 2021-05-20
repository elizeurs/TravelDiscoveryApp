//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
  
  let destinations: [Destination] = [
    .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
    .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
    .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055)
    
    
  ]
  
  var body: some View {
    VStack {
      HStack {
        Text("Popular Destinations")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal)
      .padding(.top)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8.0) {
          ForEach(destinations, id: \.self) { destination in
            NavigationLink(
              destination: PopularDestinationDetailsView(destination: destination),
              label: {
                PopularDestinationTile(destination: destination)
                  .padding(.bottom)
              })
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct PopularDestinationDetailsView: View {
  
  let destination: Destination
  
  @State var region: MKCoordinateRegion
  @State var isShowingAttractions = true
  
  init(destination: Destination) {
    self.destination = destination
    self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
  }
  
  let imageUrlStrings = [
    "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
    "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
  ]
  
  var body: some View {
    ScrollView {
      
      DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
        .frame(height: 250)
      
      //      Image(destination.imageName)
      //        .resizable()
      //        .scaledToFill()
      //        .clipped()
      
      VStack(alignment: .leading) {
        Text(destination.name)
          .font(.system(size: 18, weight: .bold))
        Text(destination.country)
        
        HStack {
          ForEach(0..<5, id: \.self) { num in
            Image(systemName: "star.fill")
              .foregroundColor(.orange)
          }
        }.padding(.top, 2)
        
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
          .padding(.top, 4)
          .font(.system(size: 14))
        
        
        HStack{ Spacer() }
        
      }
      .padding(.horizontal)
      
      HStack {
        Text("Location")
          .font(.system(size: 18, weight: .semibold))
        Spacer()
        
        Button(action: { isShowingAttractions.toggle() }, label: {
          Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
            .font(.system(size: 12, weight: .semibold))
        })
        
        // UIKit: UISwitch
        Toggle("", isOn: $isShowingAttractions)
          .labelsHidden()
        
      }.padding(.horizontal)
      
      //      Map(coordinateRegion: $region)
      //        .frame(height: 300)
      
      Map(coordinateRegion: $region, annotationItems: isShowingAttractions ?  attractions : []) { attraction in
        //        MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .red)
        
        MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
          CustomMapAnnotation(attraction: attraction)
        }
      }
      .frame(height: 300)
      
    }.navigationBarTitle(destination.name, displayMode: .inline)
  }
  
  let attractions: [Attraction] = [
    .init(name: "Eiffel_Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
    .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
    .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
  ]
}

struct CustomMapAnnotation: View {
  
  let  attraction: Attraction
  var body: some View {
    VStack {
      Image(attraction.imageName)
        .resizable()
        .frame(width: 80, height: 60)
        .cornerRadius(4)
      
      Text(attraction.name)
        .font(.system(size: 12, weight: .semibold))
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .foregroundColor(.white)
    }.shadow(radius: 5)
  }
}

struct Attraction: Identifiable {
  let id = UUID().uuidString
  
  let name, imageName: String
  let latitude, longitude: Double
}

struct PopularDestinationTile: View {
  
  let destination: Destination
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      
      Image(destination.imageName)
        .resizable()
        .scaledToFill()
        .frame(width: 125, height: 125)
        //                .clipped()
        .cornerRadius(4)
        .padding(.horizontal, 6)
        .padding(.vertical, 6)
      
      Text(destination.name)
        .font(.system(size: 12, weight: .semibold))
        .padding(.horizontal, 12)
        .foregroundColor(Color(.label))
      
      Text(destination.country)
        .font(.system(size: 12, weight: .semibold))
        .padding(.horizontal, 12)
        .padding(.bottom, 8)
        .foregroundColor(.gray)
    }
    .asTile()
    //            .modifier(TileModifier())
  }
}

struct PopularDestinationsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
    DiscoverView()
    PopularDestinationsView()
  }
}
