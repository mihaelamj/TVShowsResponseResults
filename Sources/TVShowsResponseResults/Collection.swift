//
//  Collection.swift
//
//  Created by iMacPro on 22.11.2021..
//

// MARK: - Collection Result -

public class Pagination: Decodable {
  var count: Int?
  var page: Int?
  var items: Int?
  var pages: Int?
}

public class Meta: Decodable {
  var pagination: Pagination?
}

public class Collection<T>: Decodable where T: Decodable {
  var meta: Meta?
  var results: [T]?
  
  private enum CodingKeys: String, CodingKey {
    case meta
    case shows
    case reviews
  }
  
  required public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    results = try values.decodeIfPresent([T].self, forKey: .shows)
    results = try values.decodeIfPresent([T].self, forKey: .reviews)
  }
}
