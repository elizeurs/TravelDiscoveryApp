//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

struct PopularRestaurantsView: View {
  
  let restaurants: [Restaurant] = [
    .init(name: "Japan's Finest Tapas", imageName: "tapas"),
    .init(name: "Bar & Grill", imageName: "bar_grill")
    
  ]
  
  var body: some View {
    VStack {
      HStack {
        Text("Popular Places To Eat")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal)
      .padding(.top)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8.0) {
          ForEach(restaurants, id: \.self) { restaurant in
            HStack(spacing: 8) {
              Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
                .background(Color.gray)
                .padding(.leading, 6)
                .padding(.vertical, 6)
              
              VStack(alignment: .leading, spacing: 6) {
                HStack {
                  Text(restaurant.name)
                  Spacer()
                  Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis")
                      .foregroundColor(.gray)
                  })
                }
                
                HStack {
                  Image(systemName: "star.fill")
                  Text("4.7 • Sushi • $$")
                }
                
                Text("Tokio, Japan")
              }.font(.system(size: 12, weight: .semibold))
              
              Spacer()
            }
            .frame(width: 240)
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

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
