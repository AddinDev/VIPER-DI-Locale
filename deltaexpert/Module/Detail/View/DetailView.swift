//
//  DetailView.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    ScrollView {
      VStack {
        spacer
        image
        spacer
        content
        spacer
      }
    }
    .navigationBarTitle(presenter.category.title, displayMode: .inline)
    
  }
}

extension DetailView {
  
  var spacer: some View {
    Spacer()
  }
  
  var image: some View {
    WebImage(url: URL(string: presenter.category.image))
      .resizable()
      .indicator(.activity)
      .scaledToFit()
      .frame(width: 250)
      .padding(.top)
  }
  
  var content: some View {
    Text(presenter.category.desc)
      .padding()
    
  }
}


