//
//  HomeController.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/23.
//

import SnapKit
import UIKit

final class HomeViewController: UIViewController {
  private let searchBar = UISearchBar()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
  private lazy var dataSource: UICollectionViewDiffableDataSource<Section, String> = configureDataSource()

  private var viewModel = DefaultHomeViewModel()

  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureDataSourceSnapshot()
  }

  // MARK: - UI Configuration
  private func configureUI() {
    view.backgroundColor = .systemBackground
    configureSearchBarAttributes()
    configureCollectionViewLayout()
  }

  private func configureSearchBarAttributes() {
    navigationItem.titleView = searchBar
    searchBar.placeholder = "어디로 여행가세요?"
    searchBar.delegate = self
  }

  private func configureCollectionViewLayout() {
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
  }
}

// MARK: - SearchBar Delegation
extension HomeViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_: UISearchBar) {
    searchBar.resignFirstResponder()
    DispatchQueue.main.async { [weak self] in
      self?.navigationController?.pushViewController(LocationSearchController(), animated: true)
    }
  }
}

// MARK: - Compositional Layout Configuration
extension HomeViewController {
  private enum Section: Int {
    case hero
    case nearCities
    case recommendation
  }

  private func createLayout() -> UICollectionViewCompositionalLayout {
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 40

    let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex: Int, _) in
      guard let section = Section(rawValue: sectionIndex) else {
        return nil
      }

      switch section {
      case .hero:
        return SectionFactory.createHeroSectionLayout()
      case .nearCities:
        return SectionFactory.createListPagingSectionLayout()
      case .recommendation:
        return SectionFactory.createPagingSectionLayout()
      }
    }, configuration: config)

    return layout
  }
}

// MARK: - CollectionView Diffable DataSource
extension HomeViewController {
  private func configureDataSource() -> UICollectionViewDiffableDataSource<Section, String> {
    let heroCellRegistration = createHeroCellRegistration()
    let cityCellRegistration = createNearCityCellRegistration()
    let recommendationCellRegistration = createRecommendationCellRegistration()

    let dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
      guard let section = Section(rawValue: indexPath.section) else {
        return nil
      }

      switch section {
      case .hero:
        return collectionView.dequeueConfiguredReusableCell(
          using: heroCellRegistration,
          for: indexPath,
          item: item
        )
      case .nearCities:
        return collectionView.dequeueConfiguredReusableCell(
          using: cityCellRegistration,
          for: indexPath,
          item: item
        )
      case .recommendation:
        return collectionView.dequeueConfiguredReusableCell(
          using: recommendationCellRegistration,
          for: indexPath,
          item: item
        )
      }
    })

    let sectionHeaderRegistration = createSectionHeaderRegistration()

    dataSource.supplementaryViewProvider = { collectionView, _, indexPath in
      collectionView.dequeueConfiguredReusableSupplementary(
        using: sectionHeaderRegistration, for: indexPath
      )
    }

    return dataSource
  }

  private func configureDataSourceSnapshot() {
    var heroSnapshot = NSDiffableDataSourceSectionSnapshot<String>()
    heroSnapshot.append([viewModel.bannerImage])

    var nearCitySnapshot = NSDiffableDataSourceSectionSnapshot<String>()
    nearCitySnapshot.append((0 ..< 10).map { "\($0)___\(viewModel.bannerImage)" })

    var recommendSnapshot = NSDiffableDataSourceSectionSnapshot<String>()
    recommendSnapshot.append((10 ..< 20).map { "\($0)___\(viewModel.bannerImage)" })

    dataSource.apply(heroSnapshot, to: .hero, animatingDifferences: true)
    dataSource.apply(nearCitySnapshot, to: .nearCities, animatingDifferences: true)
    dataSource.apply(recommendSnapshot, to: .recommendation, animatingDifferences: true)
  }

  private func createSectionHeaderRegistration() -> UICollectionView.SupplementaryRegistration<TitleSupplementaryView> {
    UICollectionView.SupplementaryRegistration<TitleSupplementaryView>(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, _, indexPath in
      supplementaryView.label.text = self.viewModel.getSectionTitle(at: indexPath.section)
      supplementaryView.label.numberOfLines = 0
    }
  }

  private func createHeroCellRegistration() -> UICollectionView.CellRegistration<HeroCollectionViewCell, String> {
    UICollectionView.CellRegistration<HeroCollectionViewCell, String> { cell, _, item in
      URLSession.shared.dataTask(with: URL(string: item)!) { data, _, error in
        guard let data = data, error == nil else {
          return
        }

        DispatchQueue.main.async {
          cell.setImage(UIImage(data: data))
        }

      }.resume()
    }
  }

  private func createNearCityCellRegistration() -> UICollectionView.CellRegistration<NearCityCollectionViewCell, String> {
    UICollectionView.CellRegistration<NearCityCollectionViewCell, String> { cell, _, item in
      let imageUrl = item.components(separatedBy: "___")[1]

      URLSession.shared.dataTask(with: URL(string: imageUrl)!) { data, _, error in
        guard let data = data, error == nil else {
          return
        }

        DispatchQueue.main.async {
          cell.setData(title: "서울", subtitle: "차로 30분 거리", image: UIImage(data: data))
        }

      }.resume()
    }
  }

  private func createRecommendationCellRegistration() -> UICollectionView.CellRegistration<RecommendationCollectionViewCell, String> {
    UICollectionView.CellRegistration<RecommendationCollectionViewCell, String> { cell, _, item in
      let imageUrl = item.components(separatedBy: "___")[1]

      URLSession.shared.dataTask(with: URL(string: imageUrl)!) { data, _, error in
        guard let data = data, error == nil else {
          return
        }

        DispatchQueue.main.async {
          cell.setData(title: "자연생활을 만끽할 수 있는 숙소", image: UIImage(data: data))
        }

      }.resume()
    }
  }
}
