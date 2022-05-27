//
//  HeroCollectionViewCell.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import SnapKit
import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
  private let imageView = UIImageView(frame: .zero)

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
      make.edges.equalTo(self.contentView)
    }
  }

  func setImage(_ image: UIImage?) {
    imageView.image = image
  }
}
