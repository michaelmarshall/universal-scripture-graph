//
//  Entities.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/14/24.
//

import Foundation

enum NodeType: String, Equatable, CaseIterable, Codable, Hashable {
    case Person = "Person"
    case City = "City"
    case ToPerson = "ToPerson"
    case ToCity = "ToCity"
}

struct Props: Codable, Hashable {
    var person: String? = nil
    var name: String? = nil
}

struct Node: Identifiable, Codable, Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let type: NodeType
    let props: Props
}

struct Relationship: Identifiable, Codable, Hashable {
    let id: String
    let from_id: Int
    let to_id: Int
}
