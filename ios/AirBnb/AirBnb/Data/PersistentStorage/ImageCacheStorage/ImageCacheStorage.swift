//
//  ImageCacheStorage.swift
//  AirBnb
//
//  Created by 송태환 on 2022/06/02.
//

import Foundation

protocol ImageCacheStorage {
  func retrieve(forKey url: NSURL) -> Data?
  func store(_ value: Data, forKey url: NSURL)
}
