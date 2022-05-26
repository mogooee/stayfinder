//
//  WishListViewController.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/25.
//

import SnapKit
import UIKit

class WishListViewController: UIViewController {
  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
  }

  // MARK: - UI Configuration
  private func configureUI() {
    self.view.backgroundColor = .systemBackground
  }
}
