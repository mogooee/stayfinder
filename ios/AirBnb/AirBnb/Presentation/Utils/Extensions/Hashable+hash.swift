//
//  Hashable+hash.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/31.
//

import Foundation

extension Hashable where Self: AnyObject {
  func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self))
  }
}
