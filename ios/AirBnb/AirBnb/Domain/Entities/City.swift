//
//  Region.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/31.
//

import Foundation

struct City: Hashable, Identifiable {
  typealias Identifier = Int

  let id: Identifier
  let name: String
  let distance: String
  let imageUrl: String

  init(id: Identifier, name: String, distance: String, imageUrl: String) {
    self.id = id
    self.name = name
    self.distance = distance
    self.imageUrl = imageUrl
  }
}
