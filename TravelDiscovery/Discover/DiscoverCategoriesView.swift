//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

struct DiscoverCategoriesView: View {
  
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
          NavigationLink(
            destination: CategoryDetailsView(),
            label: {
              VStack(spacing: 8) {
                //            Spacer()
                Image(systemName: category.imageName)
                  .font(.system(size: 25))
                  .foregroundColor(Color(#colorLiteral(red: 0.9989508986, green: 0.4407047629, blue: 0, alpha: 1)))
                  .frame(width: 68, height: 68)
                  .background(Color.white)
                  .cornerRadius(34)
                //              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                Text(category.name)
                  .font(.system(size: 12, weight: .semibold))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
              }.frame(width: 68)
            })
        }
      }.padding(.horizontal)
    }
  }
}

struct CategoryDetailsView: View {
  var body: some View {
    ScrollView {
        ForEach(0 ..< 5, id: \.self) { item in
          VStack(alignment: .leading, spacing: 0) {
          Image("art1")
            .resizable()
            .scaledToFill()
          
          Text("Demo 123")
            .font(.system(size: 12, weight: .semibold))
            .padding()
        }.asTile()
        .padding()
      }
    }.navigationBarTitle("Category", displayMode: .inline)
  }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
      
      NavigationView {
        CategoryDetailsView()
      }
      
      DiscoverView()
      
//      ZStack {
//        Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
//        DiscoverCategoriesView()
//      }
    }
}
