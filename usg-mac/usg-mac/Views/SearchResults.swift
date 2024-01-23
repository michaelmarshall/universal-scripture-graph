//
//  SearchResults.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import SwiftUI

struct SearchResults: View {
    
    @Environment(AppState.self) var appState: AppState

    var body: some View {
        Text("Search Results")
        
        NodeList(nodes: self.appState.searchResultNodes)
        Spacer()
    }
        
}

#Preview {
    SearchResults()
        .environment(AppState())
}
