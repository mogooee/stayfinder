//
//  Equatable+Extensions.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/31.
//

import Foundation

extension Equatable where Self: AnyObject {
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs === rhs
  }
}
