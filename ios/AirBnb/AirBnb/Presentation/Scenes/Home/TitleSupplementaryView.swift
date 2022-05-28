//
//  TitleSupplementaryView.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import SnapKit
import UIKit

class TitleSupplementaryView: UICollectionReusableView {
  static let reuseIdentifier = "TitleSupplementaryView"

  let label = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  private func configure() {
    addSubview(label)

    label.adjustsFontForContentSizeCategory = true
    label.font = UIFont.preferredFont(forTextStyle: .title2)
    label.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(10)
    }
  }
}
