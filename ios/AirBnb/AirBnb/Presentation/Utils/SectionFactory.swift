//
//  LayoutFactory.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import UIKit

enum SectionFactory {
  static func createHeroSectionLayout() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalWidth(1)
    ))

    let wrapperGroup = NSCollectionLayoutGroup.vertical(
      layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalWidth(1)
      ),
      subitem: item,
      count: 1
    )

    return NSCollectionLayoutSection(group: wrapperGroup)
  }

  static func createListPagingSectionLayout() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalHeight(1)
    ))

    let wrapperGroup = NSCollectionLayoutGroup.horizontal(
      layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1)
      ),
      subitems: [item]
    )

    return NSCollectionLayoutSection(group: wrapperGroup)
  }

  static func createPagingSectionLayout() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalHeight(1)
    ))

    let wrapperGroup = NSCollectionLayoutGroup.horizontal(
      layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1)
      ),
      subitems: [item]
    )

    return NSCollectionLayoutSection(group: wrapperGroup)
  }
}
