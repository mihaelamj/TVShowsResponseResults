//
//  Item.swift
//
//  Created by iMacPro on 22.11.2021..
//

// MARK: - Item Result -

public class Item<T>: Decodable where T: Decodable {
  public var item: T?
  
  private enum CodingKeys: String, CodingKey {
    case show
    case review
    case user
  }
  
  required public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    item = try values.decodeIfPresent(T.self, forKey: .show)
    item = try values.decodeIfPresent(T.self, forKey: .review)
    item = try values.decodeIfPresent(T.self, forKey: .user)
  }
}
