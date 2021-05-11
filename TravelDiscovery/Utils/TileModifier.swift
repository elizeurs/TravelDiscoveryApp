//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 11/05/21.
//

import SwiftUI

extension View {
  func asTile() -> some View {
    modifier(TileModifier())
  }
}

struct TileModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .background(Color.white)
      .cornerRadius(5)
      .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
  }
}
