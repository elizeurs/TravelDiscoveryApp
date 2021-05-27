//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 27/05/21.
//

import SwiftUI

struct UserDetailsView: View {
  
  let user: User
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Image(user.imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 60)
          .clipShape(Circle())
          .shadow(radius: 10)
          .padding(.top)
        Text("Amy Adams")
          .font(.system(size: 14, weight: .semibold))
        // opt 8
        HStack {
          Text("@amyadams20 •")
          Image(systemName: "hand.thumbsup.fill")
            .font(.system(size: 10, weight: .semibold))
          Text("2541")
        }
        .font(.system(size: 12, weight: .regular))
        Text("YouTuber, Vlogger, Travel Creator")
          .font(.system(size: 14, weight: .regular))
          .foregroundColor(Color(.lightGray))
        
        HStack(spacing: 12) {
          VStack {
            Text("59,394")
              .font(.system(size: 13, weight: .semibold))
            Text("Followers")
              .font(.system(size: 9, weight: .regular))
              .foregroundColor(.gray)
          }
          
          Spacer()
            .frame(width: 0.5, height: 12)
            .background(Color(.lightGray))
          
          VStack {
            Text("2,112")
              .font(.system(size: 13, weight: .semibold))
            Text("Following")
              .font(.system(size: 9, weight: .regular))
          }
        }
        
        HStack(spacing: 12) {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
              Spacer()
              Text("Follow")
                .foregroundColor(.white)
              Spacer()
            }
            .padding(.vertical, 8)
            .background(Color.orange)
            .cornerRadius(100)
          })
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
              Spacer()
              Text("Contact")
                .foregroundColor(.black)
              Spacer()
            }
            .padding(.vertical, 8)
            .background(Color(white: 0.9))
            .cornerRadius(100)
          })
        }
        .font(.system(size: 11, weight: .semibold))
        .padding(.vertical)
        
        ForEach(0 ..< 10) { num in
          HStack {
            Spacer()
          }
          .frame(height: 200)
          .background(Color(white: 0.5))
          .cornerRadius(12)
          .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
        }

      }.padding(.horizontal)
    }.navigationBarTitle(user.name, displayMode: .inline)
  }
}


struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        UserDetailsView(user: .init(name: "Amy Adams", imageName: "amy"))
      }
    }
}
