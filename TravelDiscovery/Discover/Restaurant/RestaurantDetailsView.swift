//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 21/05/21.
//

import SwiftUI

struct RestaurantDetailsView: View {
  
  let restaurant: Restaurant
  
  var body: some View {
    ScrollView {
      
      ZStack(alignment: .bottomLeading) {
        Image(restaurant.imageName)
          .resizable()
          .scaledToFill()
        
        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
        
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text(restaurant.name)
              .foregroundColor(.white)
              .font(.system(size: 18, weight: .bold))
            
            HStack {
              ForEach(0..<5, id: \.self) { num in
                Image(systemName: "star.fill")
              }.foregroundColor(.orange)
            }
          }
          Spacer()
          
          Text("See more photos")
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .regular))
        }.padding()
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Location & Description")
          .font(.system(size: 16, weight: .bold))
        
        Text("Tokio, Japan")
        
        HStack {
          ForEach(0 ..< 5, id: \.self) { num in
            Image(systemName: "dollarsign.circle.fill")
          }.foregroundColor(.orange)
        }
        
        Text("Usually when you want to write a very long description, you want to make sure that it spans at least a few lines. When i'm testing i like to see as least 5 lines of text so that things are auto sized correctly.")
          .padding(.top, 8)
          .font(.system(size: 14, weight: .regular))
      }.padding()
      
      HStack {
        Text("Popular Dishes")
          .font(.system(size: 16, weight: .bold))
        Spacer()
      }.padding(.horizontal)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 16) {
          ForEach(0 ..< 5, id: \.self) { num in
            VStack(alignment: .leading) {
              Image("tapas")
                .resizable()
                .scaledToFill()
                .frame(height: 80)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                .shadow(radius: 2)
                .padding(.vertical, 2)
              
              Text("Japanese Tapas")
                .font(.system(size: 14, weight: .bold))
              Text("88 photos")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular))
            }
          }
        }.padding(.horizontal)
      }
    }
    .navigationBarTitle("Restaurant Details", displayMode: .inline)
  }
}
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapas", imageName: "tapas"))
    }
}
