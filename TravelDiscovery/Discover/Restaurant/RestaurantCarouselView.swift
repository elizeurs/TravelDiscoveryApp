//
//  RestaurantCarouselView.swift
//  TravelDiscovery
//
//  Created by Elizeu RS on 26/05/21.
//

import SwiftUI
import KingfisherSwiftUI

struct RestaurantCarouselContainer: UIViewControllerRepresentable {
  
  let imageUrlStrings: [String]
  let selectedIndex: Int
  
  func makeUIViewController(context: Context) -> UIViewController {
    
    let pvc = CarouselPageViewController(imageUrlStrings: imageUrlStrings, selectedIndex: selectedIndex)
    return pvc
  }
  
  typealias UIViewControllerType = UIViewController
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
  }
}

class CarouselPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    allControllers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return self.selectedIndex
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
  var selectedIndex: Int
  
  
  init(imageUrlStrings: [String], selectedIndex: Int) {
    self.selectedIndex = selectedIndex
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.red
    
    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    //    view.backgroundColor = .orange
    
    // pages that we swipe through
    allControllers = imageUrlStrings.map({ imageName in
      let hostingController = UIHostingController(rootView:
                                                    ZStack {
                                                      Color.black
                                                      KFImage(URL(string: imageName))
                                                      .resizable()
                                                      .scaledToFit()
                                                    }
                                                    )
                                                  hostingController.view.clipsToBounds = true
      return hostingController
      
    })
    
    if selectedIndex < allControllers.count {
      setViewControllers([allControllers[selectedIndex]],
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


//struct RestaurantCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantCarouselView()
//    }
//}
