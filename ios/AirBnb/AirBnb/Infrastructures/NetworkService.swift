//
//  NetworkService.swift
//  AirBnb
//
//  Created by 송태환 on 2022/06/02.
//

import Foundation
import OSLog

enum NetworkError: Error {
  case parseError
  case error(statusCode: Int, data: Data?)
  case emptyData
}

final class NetworkService {
  private let session: URLSession

  init(session: URLSession = URLSession.shared) {
    self.session = session
  }

  func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
    session.dataTask(with: request) { data, response, error in
      if let error = error {
        if let response = response as? HTTPURLResponse {
          completion(.failure(.error(statusCode: response.statusCode, data: data)))
        } else {
          // TODO: Request Error handling
          Logger().error("\(error.localizedDescription)")
        }

        return
      }

      guard let data = data else {
        completion(.failure(.emptyData))
        return
      }

      do {
        let result = try JSONDecoder().decode(T.self, from: data)
        completion(.success(result))
      } catch {
        completion(.failure(.parseError))
      }
    }
  }
}
