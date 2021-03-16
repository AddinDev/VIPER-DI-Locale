//
//  CategoryMapper.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

final class CategoryMapper {
  
  static func responseToEntity(for cats: [CategoryResponse]) -> [CategoryEntity] {
    return cats.map { cat in
      let catEntity = CategoryEntity()
      catEntity.id = cat.id ?? ""
      catEntity.title = cat.title ?? ""
      catEntity.image = cat.image ?? ""
      catEntity.desc = cat.desc ?? ""
      return catEntity
    }
  }
  
  static func entityToDomain(for cats: [CategoryEntity]) -> [CategoryModel] {
    return cats.map { cat in
      return CategoryModel(id: cat.id,
                           title: cat.title,
                           image: cat.image,
                           desc: cat.desc)
    }
  }
  
  static func responseToDomain(for cats: [CategoryResponse]) -> [CategoryModel] {
    return cats.map { cat in
      return CategoryModel(id: cat.id ?? "",
                           title: cat.title ?? "",
                           image: cat.image ?? "",
                           desc: cat.desc ?? "")
    }
  }
  
}
