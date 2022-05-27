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
        heightDimension: .fractionalHeight(0.5)
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
        widthDimension: .fractionalWidth(0.8),
        heightDimension: .fractionalHeight(0.3)
      ),
      subitem: item,
      count: 2 // 그룹당 2개만 배치
    )

    verticalGroup.interItemSpacing = .fixed(5)

    let section = NSCollectionLayoutSection(group: verticalGroup)
    section.interGroupSpacing = 5
    section.orthogonalScrollingBehavior = .groupPaging

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
        widthDimension: .fractionalWidth(0.8),
        heightDimension: .fractionalHeight(0.4)
      ),
      subitem: item,
      count: 1 // 그룹당 1개만 배치
    )

    horizontalGroup.interItemSpacing = .flexible(5)

    let section = NSCollectionLayoutSection(group: horizontalGroup)
    section.interGroupSpacing = 5
    section.orthogonalScrollingBehavior = .groupPaging

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
