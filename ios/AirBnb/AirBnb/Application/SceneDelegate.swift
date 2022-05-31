//
//  SceneDelegate.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else {
      return
    }

    let tabBarController = UITabBarController()
    let homeController = HomeViewController.create(with: DefaultHomeViewModel())
    let wishListController = WishListViewController()
    let reservationController = ReservationViewController()

    homeController.tabBarItem = .init(
      title: "검색",
      image: .magnifier,
      selectedImage: .magnifier
    )

    wishListController.tabBarItem = .init(
      title: "위시리스트",
      image: .heart,
      selectedImage: .heartFilled
    )

    reservationController.tabBarItem = .init(
      title: "예약",
      image: .profile,
      selectedImage: .profileFilled
    )

    tabBarController.viewControllers = [
      UINavigationController(rootViewController: homeController),
      UINavigationController(rootViewController: wishListController),
      reservationController
    ]

    tabBarController.tabBar.backgroundColor = .gray6
    tabBarController.tabBar.addTopBorder(with: .gray4, andWidth: 0.5)

    window = UIWindow(windowScene: scene)
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}
