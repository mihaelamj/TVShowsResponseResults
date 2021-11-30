//
//  Collection.swift
//
//  Created by iMacPro on 22.11.2021..
//

// MARK: - Collection Result -

public class Pagination: Decodable {
  public var count: Int?
  public var page: Int?
  public var items: Int?
  public var pages: Int?
}

public class Meta: Decodable {
  public var pagination: Pagination?
}

public class Collection<T>: Decodable where T: Decodable {
  public var meta: Meta?
  public var results: [T]?
  
  private enum CodingKeys: String, CodingKey {
    case meta
    case shows
    case reviews
  }
  
  required public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    
    results = try values.decodeIfPresent([T].self, forKey: .shows)
    if let res = results, !res.isEmpty { return }
    
    results = try values.decodeIfPresent([T].self, forKey: .reviews)
  }
}
