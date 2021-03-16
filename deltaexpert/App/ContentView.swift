//
//  ContentView.swift
//  deltaexpert
//
//  Created by addin on 15/03/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var presenter: HomePresenter
    var body: some View {
      NavigationView {
       HomeView(presenter: presenter)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
