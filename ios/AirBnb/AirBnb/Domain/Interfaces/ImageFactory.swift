//
//  ImageFactory.swift
//  AirBnb
//
//  Created by 송태환 on 2022/06/02.
//

import Foundation

protocol ImageRepository {
  func fetchImage(with url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
