//
//  ImageCache.swift
//  AirBnb
//
//  Created by 송태환 on 2022/06/02.
//

import Foundation

final class DefaultImageCacheStorage {
  private let cache = NSCache<NSURL, NSData>()

  private var diskDirectoryURL: URL? {
    try? FileManager.default.url(
      for: .applicationSupportDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: true
    )
  }

  private func joinPath(base: String, path: [String]) -> String {
    path.reduce(base) { "\($0)/\($1)" }
  }

  private func getDiskFileURL(forKey url: NSURL) -> URL? {
    guard let directoryURL = diskDirectoryURL, let filename = url.lastPathComponent else {
      return nil
    }

    let path = joinPath(base: directoryURL.path, path: [filename])

    return URL(fileURLWithPath: path)
  }

  private func getValueFromDiskCache(forKey url: NSURL) -> Data? {
    guard let fileURL = getDiskFileURL(forKey: url) else {
      return nil
    }

    guard let data = try? Data(contentsOf: fileURL) else {
      return nil
    }

    store(data, forKey: url)

    return data
  }
}

extension DefaultImageCacheStorage: ImageCacheStorage {
  func retrieve(forKey url: NSURL) -> Data? {
    if let value = cache.object(forKey: url) as? Data {
      return value
    }

    return getValueFromDiskCache(forKey: url)
  }

  func store(_ value: Data, forKey url: NSURL) {
    cache.setObject(value as NSData, forKey: url)
  }
}
