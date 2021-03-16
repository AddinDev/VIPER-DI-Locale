//
//  HomeUseCase.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

protocol HomeUseCase {
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)
}

class HomeInteractor: HomeUseCase {
  
  private let repository: MealRepository
  init(repo: MealRepository) {
    self.repository = repo
  }
  
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void) {
    repository.getCategories { res in
      result(res)
    }
  }
  
}
