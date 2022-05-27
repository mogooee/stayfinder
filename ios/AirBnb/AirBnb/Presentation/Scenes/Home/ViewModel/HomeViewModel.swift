//
//  HomeViewModel.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/27.
//

import Foundation

protocol HomeViewModel {
  func getSectionTitle(at index: Int) -> String
}

struct DefaultHomeViewModel: HomeViewModel {
  private let titles = ["", "가까운 여행지 둘러보기", "어디에서나, 여행은\n살아보는거야!"]

  func getSectionTitle(at index: Int) -> String {
    titles[index]
  }
}
