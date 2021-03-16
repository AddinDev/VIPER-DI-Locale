//
//  CategoryRow.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
  var category: CategoryModel
  var body: some View {
    VStack {
      image
      spacer
      content
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    .background(Color.blue.opacity(0.3))
    .cornerRadius(32)
  }
}

extension CategoryRow {
  
  var spacer: some View {
    Spacer()
  }
  
  var image: some View {
    WebImage(url: URL(string: category.image))
      .resizable()
      .indicator(.activity)
      .scaledToFit()
      .frame(width: 200)
      .padding(.top)
  }
  
  var content: some View {
    VStack {
      Text(category.title)
        .font(.title)
      Text(category.desc)
        .font(.system(size: 14))
        .lineLimit(2)
    }
    .padding()
    .foregroundColor(.black)
  }
  
}


