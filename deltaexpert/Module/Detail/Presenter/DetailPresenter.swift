//
//  DetailPresenter.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

class DetailPresenter: ObservableObject {
  
  private let useCase: DetailUseCase
  
  @Published var category: CategoryModel
  
  init(useCase: DetailUseCase) {
    self.useCase = useCase
    self.category = useCase.getCategory()
  }
  
}
