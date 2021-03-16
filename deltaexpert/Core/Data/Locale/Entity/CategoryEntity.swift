//
//  CategoryEntity.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation
import RealmSwift

class CategoryEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var desc: String = ""

  override static func primaryKey() -> String? {
    return "id"
  }
  
}
