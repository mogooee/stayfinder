//
//  NearCityCollectionViewCell.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import SnapKit
import UIKit

class NearCityCollectionViewCell: UICollectionViewCell {
  private let imageView = UIImageView(frame: .zero)
  private let cityName = UILabel()
  private let distanceLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  private func configure() {
    contentView.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.top.equalTo(contentView)
      make.leading.equalTo(contentView)
      make.bottom.equalTo(contentView)
    }

    cityName.adjustsFontSizeToFitWidth = true
    distanceLabel.adjustsFontSizeToFitWidth = true

    let stack = UIStackView(arrangedSubviews: [cityName, distanceLabel])
    stack.axis = .vertical

    contentView.addSubview(stack)
    stack.snp.makeConstraints { make in
      make.centerY.equalTo(imageView)
      make.leading.equalTo(imageView).offset(6)
    }
  }

  func setImage(_ image: UIImage?) {
    imageView.image = image
  }

  func setCityName(_ text: String) {
    cityName.text = text
  }

  func setDistanceText(_ text: String) {
    distanceLabel.text = text
  }
}
