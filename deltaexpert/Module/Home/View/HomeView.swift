//
//  HomeView.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    ZStack {
      if presenter.load {
        loading
      } else {
        ScrollView {
          LazyVStack {
            ForEach(presenter.categories, id: \.id) { cat in
              presenter.linkBuilder(for: cat) {
                CategoryRow(category: cat)  
              }
            }
          }
        }
      }
    }
    .navigationBarTitle("Meals App", displayMode: .automatic)
    .onAppear {
      if presenter.categories.count == 0 {
      presenter.getCategories()
      }
    }
  }
  
}

extension HomeView {
  
  var loading: some View {
    VStack {
      Text("Loading")
      ProgressView()
    }
  }
  
}
