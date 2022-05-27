//
//  HomeController.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/23.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {
  private let searchBar = UISearchBar()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
  private lazy var dataSource: UICollectionViewDiffableDataSource<Section, String> = configureDataSource()

  private let titles = ["슬기로운\n자연생활", "가까운 여행지 둘러보기", "어디에서나, 여행은\n살아보는거야!"]

  var viewModel: HomeViewModel = DefaultHomeViewModel()

  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureDataSourceSnapshot()
  }

  // MARK: - UI Configuration
  private func configureUI() {
    view.backgroundColor = .systemBackground
    configureSearchBar()
    configureCollectionView()
  }

  private func configureSearchBar() {
    navigationItem.titleView = searchBar
    searchBar.placeholder = "어디로 여행가세요?"
    searchBar.delegate = self
  }

  private func configureCollectionView() {
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
  }
}

// MARK: - SearchBar Delegation
extension HomeViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_: UISearchBar) {
    searchBar.endEditing(true)
  }

  func searchBarTextDidEndEditing(_: UISearchBar) {
    DispatchQueue.main.async { [weak self] in
      self?.navigationController?.pushViewController(LocationSearchController(), animated: true)
    }
  }
}

// MARK: - Compositional Layout Configuration
extension HomeViewController {
  enum Section: Int {
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

    return UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
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
  }

  private func applyInitialDataSource() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
    snapshot.appendSections([.hero, .nearCities, .recommendation])
    snapshot.appendItems(["black"], toSection: .hero)
    snapshot.appendItems(["white"], toSection: .nearCities)
    snapshot.appendItems(["green"], toSection: .recommendation)

    dataSource.apply(snapshot, animatingDifferences: false)
  }

  private func createHeroCellRegistration() -> UICollectionView.CellRegistration<HeroCollectionViewCell, String> {
    UICollectionView.CellRegistration<HeroCollectionViewCell, String> { cell, _, item in
      print("HERO: \(item)")
      cell.backgroundColor = .orange

      URLSession.shared.dataTask(with: URL(string: "https://s3-alpha-sig.figma.com/img/21b4/b910/27e59a819a2b8cb93633590403acaa63?Expires=1654473600&Signature=H3UXgUlg2p-2iL4ODel45qKyZNWKDe3PqxxtcSFK6mlVeuw5PXeIE4UwPggmnSWYNOyKq6cOnACwNGYqKkg45EtuoqWFn3mp8l4tZuEx7ViFNx0rGp-guxfBvDw4jlIQP5n9hQsrkneEuEzgcwjM7SLzg6PzXmkoC0qRZL0lCGu6tbvymD5VWxSNvNXCoRsMELNOUVeLJcB4YuYp4J8LISfF4Mh9NazJZCZHqRozUKPDkXSLMcm48ttdf7hfUzdeHP8vW~OCE3RiaiR2iozG-brxdZQ4kUh2CLVeA9r7SEhJB1T9VSlQkk3zEL7SH5tJopnM81EaHSdcBxzLqi-P1A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!) { data, _, error in
        guard let data = data, error == nil else {
          return
        }

        DispatchQueue.main.async {
          cell.imageView.image = UIImage(data: data)
        }

      }.resume()
    }
  }

  private func createNearCityCellRegistration() -> UICollectionView.CellRegistration<NearCityCollectionViewCell, String> {
    UICollectionView.CellRegistration<NearCityCollectionViewCell, String> { cell, _, item in
      print("Near: \(item)")
      cell.backgroundColor = .red
    }
  }

  private func createRecommendationCellRegistration() -> UICollectionView.CellRegistration<RecommendationCollectionViewCell, String> {
    UICollectionView.CellRegistration<RecommendationCollectionViewCell, String> { cell, _, item in
      print("Recommendation: \(item)")
      cell.backgroundColor = .blue
    }
  }
}
