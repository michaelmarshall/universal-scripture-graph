//
//  AppState.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import Foundation

@Observable class AppState {
    
    var getNodes: Bool = false
    
    var searchKey: String? = nil
    var searchValueNumber: Int64? = nil
    var searchValueString: String? = nil
    
    var searchResultNodes: [Node] = []

    var selectedNodeId: Int64? = nil
    var relatedNodes: [Node] = []
    
    var createNodeResponse: [Node] = []
}
