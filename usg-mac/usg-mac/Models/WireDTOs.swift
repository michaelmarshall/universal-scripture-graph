//
//  DTOs.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/14/24.
//

import Foundation

enum NetError: Error {
    case InvalidUrl
    case InvalidResponse
    case InvalidData
    case UnableToComplete
}

enum ResponseError: String, Codable {
    case NoError = "NoError"
    case UnknownError = "UnknownError"
}

struct GetNodes: Codable {
    let request: [Node]
}

struct ListNodesRequest: Codable {
    let offset: Int
    let limit: Int
}

struct ListNodesResponse: Codable {
    let nodes: [Node]
}

struct CreateNodeRequest: Codable {
    let type: NodeType
    let props: Props
}
