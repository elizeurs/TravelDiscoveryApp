//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 13/05/21.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let aiv = UIActivityIndicatorView(style: .large)
    aiv.startAnimating()
    aiv.color = .white
    return aiv
  }
  
  typealias UIViewType = UIActivityIndicatorView
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    
  }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
