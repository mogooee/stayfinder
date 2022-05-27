//
//  NearCityCollectionViewCell.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import UIKit

class NearCityCollectionViewCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  private func configure() {}
}
