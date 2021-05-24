//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 24/05/21.
//

import SwiftUI

struct RestaurantPhotosView: View {
  var body: some View {
    ScrollView {
      
      // GRID
      
      LazyVGrid(columns: [
        GridItem(.fixed(125), spacing: 4),
        GridItem(.fixed(125), spacing: 4),
        GridItem(.fixed(125))
      ], spacing: 4, content: {
        
        ForEach(0..<15, id: \.self) { num in
          Text("Placeholder")
            .padding()
            .background(Color.red)
        }
      })
    }.navigationBarTitle("All Photos", displayMode: .inline)
  }
}


struct RestaurantPhotosView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        RestaurantPhotosView()
      }
    }
  }
}
