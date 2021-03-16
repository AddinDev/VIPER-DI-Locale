//
//  DetailUseCase.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

protocol DetailUseCase {
  func getCategory() -> CategoryModel
}

class DetailInteractor: DetailUseCase {
  
  private let repository: MealRepository
  private let category: CategoryModel
  
  init(repo: MealRepository, cat: CategoryModel) {
    self.repository = repo
    self.category = cat
  }
  
  func getCategory() -> CategoryModel {
    return category
  }
  
}
