//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

struct PopularDestinationsView: View {
  
  let destinations: [Destination] = [
    .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
    .init(name: "Tokyo", country: "Japan", imageName: "japan"),
    .init(name: "New York", country: "US", imageName: "new_york")
    
    
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
              Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
            }
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
            .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
        DiscoverView()
    }
}
