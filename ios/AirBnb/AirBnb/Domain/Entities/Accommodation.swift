//
//  Place.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/31.
//

import Foundation

struct Accommodation: Hashable, Identifiable {
  typealias Identifier = Int

  let id: Identifier
  let description: String
  let imageUrl: String
}
