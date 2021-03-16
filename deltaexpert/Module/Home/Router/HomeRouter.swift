//
//  HomeRouter.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for cat: CategoryModel) -> some View {
    let useCase = Injection.init().provideDetail(cat: cat)
    let presenter = DetailPresenter(useCase: useCase)
    return DetailView(presenter: presenter)
  }
  
}
