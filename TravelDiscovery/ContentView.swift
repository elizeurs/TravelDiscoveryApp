//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 08/05/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      
      ScrollView {
        
        DiscoveryCategoriesView()
        
        PopularDestinationsView()
        
        PopularRestaurantsView()
        
        TrendingCreatorsView()
        
      }.navigationTitle("Discovery")
    }
  }
}

struct Destination: Hashable {
  let name, country, imageName: String
}

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
              .frame(width: 125)
              .background(Color(.init(white: 0.9, alpha: 1)))
              .cornerRadius(5)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct PopularRestaurantsView: View {
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
          ForEach(0 ..< 5, id: \.self) { num in
            Spacer()
              .frame(width: 200, height: 64)
              .background(Color.gray)
              .cornerRadius(5)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct TrendingCreatorsView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Trending Creators")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("See All")
          .font(.system(size: 12, weight: .semibold))
      }.padding(.horizontal)
      .padding(.top)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8.0) {
          ForEach(0 ..< 5, id: \.self) { num in
            Spacer()
              .frame(width: 50, height: 50)
              .background(Color.gray)
              .cornerRadius(.infinity)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
              .padding(.bottom)
          }
        }.padding(.horizontal)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Category: Hashable {
  let name, imageName: String
}

struct DiscoveryCategoriesView: View {
  
  let categories: [Category] = [
    .init(name: "Art", imageName: "paintpalette.fill"),
    .init(name: "Sport", imageName: "sportscourt.fill"),
    .init(name: "Live Events", imageName: "music.mic"),
    .init(name: "Food", imageName: "music.mic"),
    .init(name: "History", imageName: "music.mic"),
  ]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 14) {
        ForEach(categories, id: \.self) { category in
          VStack(spacing: 8) {
//            Spacer()
            Image(systemName: category.imageName)
              .font(.system(size: 20))
              .foregroundColor(.white)
              .frame(width: 68, height: 68)
              .background(Color.gray)
              .cornerRadius(34)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            Text(category.name)
              .font(.system(size: 12, weight: .semibold))
              .multilineTextAlignment(.center)
          }.frame(width: 68)
        }
      }.padding(.horizontal)
    }
  }
}
