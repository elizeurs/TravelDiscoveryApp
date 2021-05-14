//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
  
  let build: () -> Content
  
  init(_ build: @autoclosure @escaping () -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}

struct DiscoverCategoriesView: View {
  
  let categories: [Category] = [
    .init(name: "Art", imageName: "paintpalette.fill"),
    .init(name: "Sports", imageName: "sportscourt.fill"),
    .init(name: "Live Events", imageName: "music.mic"),
    .init(name: "Food", imageName: "tray.fill"),
    .init(name: "History", imageName: "books.vertical.fill"),
  ]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 14) {
        ForEach(categories, id: \.self) { category in
          NavigationLink(
            destination: NavigationLazyView(CategoryDetailsView(name: category.name)),
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

struct DiscoverCategoriesView_Previews: PreviewProvider {
  static var previews: some View {
    
//    NavigationView {
//      CategoryDetailsView()
//    }
    
    DiscoverView()
    
    //      ZStack {
    //        Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
    //        DiscoverCategoriesView()
    //      }
  }
}
