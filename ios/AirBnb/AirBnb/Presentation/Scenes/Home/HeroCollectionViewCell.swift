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
  private let title = UILabel()
  private let subtitle = UILabel()
  private let button: UIButton = {
    var config = UIButton.Configuration.filled()
    config.background.backgroundColor = .gray1
    let button = UIButton(configuration: config)
    button.setTitle("여행 아이디어 얻기", for: .normal)
    return button
  }()

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
      make.edges.equalTo(contentView)
    }

    title.text = "슬기로운\n자연생활"
    title.numberOfLines = 0
    title.font = .preferredFont(forTextStyle: .title1)
    title.adjustsFontSizeToFitWidth = true
    subtitle.text = "에어비앤비가 엄선한\n위시리스트를 만나보세요."
    subtitle.numberOfLines = 0
    subtitle.font = .preferredFont(forTextStyle: .title3)
    subtitle.adjustsFontSizeToFitWidth = true

    let stack = UIStackView(arrangedSubviews: [title, subtitle])
    stack.axis = .vertical
    stack.spacing = 10
    stack.alignment = .top
    stack.distribution = .fillProportionally

    contentView.addSubview(stack)
    stack.snp.makeConstraints { make in
      make.top.equalTo(contentView).offset(16)
      make.leading.equalTo(contentView).offset(16)
      make.trailing.lessThanOrEqualTo(contentView).offset(16)
    }

    contentView.addSubview(button)
    button.snp.makeConstraints { make in
      make.top.equalTo(stack.snp.bottom).offset(10)
      make.leading.equalTo(contentView).offset(16)
      make.trailing.lessThanOrEqualTo(contentView).offset(16)
      make.bottom.lessThanOrEqualTo(contentView)
    }
  }

  func setImage(_ image: UIImage?) {
    imageView.image = image
  }
}
