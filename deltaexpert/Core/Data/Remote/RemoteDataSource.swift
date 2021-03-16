//
//  RemoteDataSource.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation
import Alamofire

protocol RemoteDataSourceProtocol {
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void)
}

class RemoteDataSource {
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  init() { }
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void) {
    guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
    AF.request(url)
      .validate()
      .responseDecodable(of: CategoryResponses.self) { response in
        switch response.result {
        case .success(let value):
          result(.success(value.categories))
        case .failure:
          result(.failure(.invalidResponse))
        }
      }
  }

}
