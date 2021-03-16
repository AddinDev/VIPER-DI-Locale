//
//  CategoryResponse.swift
//  deltaexpert
//
//  Created by addin on 16/03/21.
//

import Foundation

struct CategoryResponses: Decodable {
  
  let categories: [CategoryResponse]
  
}

struct CategoryResponse: Decodable {
  
  let id: String?
  let title: String?
  let image: String?
  let desc: String?
  
  enum CodingKeys: String, CodingKey {
    
    case id = "idCategory"
    case title = "strCategory"
    case image = "strCategoryThumb"
    case desc = "strCategoryDescription"
    
  }
  
}
