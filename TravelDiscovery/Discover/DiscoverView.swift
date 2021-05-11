//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 08/05/21.
//

import SwiftUI

struct DiscoverView: View {
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [
      .foregroundColor: UIColor.white
    ]
  }
  
  var body: some View {
    NavigationView {
      
      ZStack {
        
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        
        Color(.init(white: 0.95, alpha: 1))
          .offset(y: 400)
        
        ScrollView {
          
          HStack {
            Image(systemName: "magnifyingglass")
            Text("Where do you want to go?")
            Spacer()
          }.font(.system(size: 14, weight: .semibold))
          .foregroundColor(.white)
          .padding()
          .background(Color(.init(white: 1, alpha: 0.3)))
          .cornerRadius(10)
          .padding(16)
          
          DiscoverCategoriesView()
          
          VStack {
            PopularDestinationsView()
            
            PopularRestaurantsView()
            
            TrendingCreatorsView()
            
          }.background(Color(.init(white: 0.95, alpha: 1)))
          .cornerRadius(16)
          .padding(.top, 32)
        }
      }
      .navigationTitle("Discovery")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    DiscoverView()
  }
}


