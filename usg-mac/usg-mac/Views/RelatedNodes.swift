//
//  RelatedNodes.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import SwiftUI

struct RelatedNodes: View {
    
    @Environment(AppState.self) var appState: AppState

    var body: some View {
        Text("Related Nodes")
        Spacer()
    }
}

#Preview {
    RelatedNodes()
        .environment(AppState())
}
