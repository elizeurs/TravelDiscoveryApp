//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 16/05/21.
//

import SwiftUI
import KingfisherSwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
  
  let imageUrlStrings: [String]
  
  func makeUIViewController(context: Context) -> UIViewController {
    
    let pvc = CustomPageViewController(imageUrlStrings: imageUrlStrings)
    return pvc
  }
  
  typealias UIViewControllerType = UIViewController
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
  }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    allControllers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    0
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = allControllers.firstIndex(of: viewController) else { return nil }
    
    if index == 0 { return nil }
    return allControllers[index - 1]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = allControllers.firstIndex(of: viewController) else { return nil }
    if index == allControllers.count - 1 { return nil }
    return allControllers[index + 1]
  }
  
  
  //  let firstVC = UIHostingController(rootView: Text("First View Controller"))
  //  let secondVC = UIHostingController(rootView: Text("Second"))
  //  let thirdVC = UIHostingController(rootView: Text("Third"))
  
  var allControllers: [UIViewController] = []
  
  init(imageUrlStrings: [String]) {
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.red
    
    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    //    view.backgroundColor = .orange
    
    // pages that we swipe through
    allControllers = imageUrlStrings.map({ imageName in
      let hostingController = UIHostingController(rootView:
                                                      KFImage(URL(string: imageName))
                                                      .resizable()
                                                      .scaledToFill()
                                                    )
                                                  hostingController.view.clipsToBounds = true
      return hostingController
      
    })
    
    if let first = allControllers.first {
      setViewControllers([first],
                         direction: .forward,
                         animated: true,
                         completion: nil)
    }
    
    self.dataSource = self
    self.delegate = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
  
  static let imageUrlStrings = [  "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",  "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",   "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
  ]
  
  static var previews: some View {
    DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
      .frame(height: 300)
    NavigationView {
      PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
  }
}

