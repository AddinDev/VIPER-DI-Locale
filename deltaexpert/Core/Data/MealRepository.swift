//
//  MealRepository.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

protocol MealRepositoryProtocol {
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)
}

final class MealRepository: NSObject {
  
  typealias MealInstance = (LocaleDataSource, RemoteDataSource) -> MealRepository
  fileprivate let locale: LocaleDataSource
  fileprivate let remote: RemoteDataSource
  
  init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: MealInstance = { localeRepo, remoteRepo in
    return MealRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension MealRepository: MealRepositoryProtocol {
  
  func getCategories(
    result: @escaping (Result<[CategoryModel], Error>) -> Void
  ) {
    locale.getCategories { localeResponses in
      switch localeResponses {
      case .success(let categoryEntity):
        let categoryList = CategoryMapper.entityToDomain(for: categoryEntity)
        if categoryList.isEmpty {
          self.remote.getCategories { remoteResponses in
            switch remoteResponses {
            case .success(let categoryResponses):
              let categoryEntities = CategoryMapper.responseToEntity(for: categoryResponses)
              self.locale.addCategories(from: categoryEntities) { addState in
                switch addState {
                case .success(let resultFromAdd):
                  if resultFromAdd {
                    self.locale.getCategories { localeResponses in
                      switch localeResponses {
                      case .success(let categoryEntity):
                        let resultList = CategoryMapper.entityToDomain(for: categoryEntity)
                        result(.success(resultList))
                      case .failure(let error):
                        result(.failure(error))
                      }
                    }
                  }
                case .failure(let error):
                  result(.failure(error))
                }
              }
            case .failure(let error):
              result(.failure(error))
            }
          }
        } else {
          result(.success(categoryList))
        }
      case .failure(let error):
        result(.failure(error))
      }
    }
  }
  
}
