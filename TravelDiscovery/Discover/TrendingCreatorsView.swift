//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

struct TrendingCreatorsView: View {
  
  let users: [User] = [
    .init(id: 0, name: "Amy Adams", imageName: "amy"),
    .init(id: 1, name: "Billy", imageName: "billy"),
    .init(id: 2, name: "Sam Smith", imageName: "sam")
  ]
  
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
        HStack(alignment: .top, spacing: 12) {
          ForEach(users, id: \.self) { user in
            NavigationLink(
              destination: NavigationLazyView(UserDetailsView(user: user)),
              label: {
                DiscoverUserView(user: user)
              })
          }
        }.padding(.horizontal)
        .padding(.bottom)
      }
    }
  }
}


struct DiscoverUserView: View {
  
  let user: User
  
  var body: some View {
    VStack {
      Image(user.imageName)
        .resizable()
        .scaledToFill()
        .frame(width: 60, height: 60)
        .background(Color(.init(white: 0.9, alpha: 1)))
        .cornerRadius(30)
      
      Text(user.name)
        .font(.system(size: 11, weight: .semibold))
        .multilineTextAlignment(.center)
        .foregroundColor(Color(.label)) // .label works for dark/light mode
    }
    .frame(width: 60)
    .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
  }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
//        TrendingCreatorsView()
      DiscoverView()
    }
}
