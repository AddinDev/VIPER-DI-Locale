//
//  Injection.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
  
  private func provideRepo() -> MealRepository {
    let realm = try? Realm()
    
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return MealRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
    return HomeInteractor(repo: provideRepo())
  }
  
  func provideDetail(cat: CategoryModel) -> DetailUseCase {
    return DetailInteractor(repo: provideRepo(), cat: cat)
  }
  
}
