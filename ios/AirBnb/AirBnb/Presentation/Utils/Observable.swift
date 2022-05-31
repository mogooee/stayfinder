//
//  Observable.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/26.
//

import Foundation

final class Observable<T> {
  typealias ObserverBlock = (T) -> Void

  struct Observer {
    weak var identity: AnyObject?
    var block: ObserverBlock
  }

  private(set) var value: T {
    didSet {
      notifyObservers()
    }
  }

  private var observers: [Observer] = []

  init(value: T) {
    self.value = value
  }

  private func notifyObservers() {
    observers.forEach { observer in
      observer.block(self.value)
    }
  }

  func bind(to observer: AnyObject, with block: @escaping ObserverBlock) {
    observers.append(Observer(identity: observer, block: block))
    block(value)
  }
}
