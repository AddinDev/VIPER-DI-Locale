//
//  HomePresenter.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import SwiftUI

class HomePresenter: ObservableObject {
  
  private let router = HomeRouter()
  private let useCase: HomeUseCase
  
  @Published var categories: [CategoryModel] = []
  @Published var load: Bool = false
  @Published var msg: String = ""

  init(useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  func getCategories() {
    load = true
    useCase.getCategories { result in
      switch result {
      case .success(let cats):
        DispatchQueue.main.async {
          self.categories = cats
          self.load = false
        }
      case .failure(let error):
        DispatchQueue.main.async {
          self.msg = error.localizedDescription
          self.load = false
        }
      }
    }
  }
  
  func linkBuilder<Content: View>(for category: CategoryModel,@ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(for: category)) { content() }
  }
  
}
