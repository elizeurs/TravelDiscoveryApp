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
        
      }.navigationTitle("Discovery")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct DiscoveryCategoriesView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(0 ..< 5) { num in
          VStack(spacing: 4) {
            Spacer()
              .frame(width: 50, height: 50)
              .background(Color.gray)
              .cornerRadius(.infinity)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            Text("Art")
              .font(.system(size: 12, weight: .semibold))
          }
        }
      }.padding(.horizontal)
    }
  }
}
