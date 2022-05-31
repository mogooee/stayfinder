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
      heightDimension: .fractionalHeight(1)
    ))

    let group = NSCollectionLayoutGroup.vertical(
      layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalWidth(1)
      ),
      subitems: [item]
    )

    return NSCollectionLayoutSection(group: group)
  }

  static func createListPagingSectionLayout() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalHeight(1)
    ))

    let verticalGroup = NSCollectionLayoutGroup.vertical(
      layoutSize: .init(
        widthDimension: .fractionalWidth(0.73),
        heightDimension: .fractionalWidth(0.4)
      ),
      subitem: item,
      count: 2 // 그룹당 2개만 배치
    )

    verticalGroup.interItemSpacing = .fixed(24)

    let section = NSCollectionLayoutSection(group: verticalGroup)
    section.interGroupSpacing = 16
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets = .init(top: 24, leading: 16, bottom: 0, trailing: 16)

    section.boundarySupplementaryItems = [
      .init(
        layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)),
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
      )
    ]

    return section
  }

  static func createPagingSectionLayout() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalHeight(1)
    ))

    let horizontalGroup = NSCollectionLayoutGroup.horizontal(
      layoutSize: .init(
        widthDimension: .fractionalWidth(0.73),
        heightDimension: .fractionalWidth(0.9)
      ),
      subitem: item,
      count: 1
    )

    let section = NSCollectionLayoutSection(group: horizontalGroup)
    section.interGroupSpacing = 16
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets = .init(top: 28, leading: 16, bottom: 48, trailing: 16)

    section.boundarySupplementaryItems = [
      .init(
        layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)),
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
      )
    ]

    return section
  }
}
