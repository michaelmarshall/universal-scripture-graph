//
//  SelectedNodes.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import SwiftUI

struct SelectedNodes: View {
    
    @Environment(AppState.self) var appState: AppState
    
    var body: some View {
        Text("Selected Nodes")
        Spacer()
    }
}

#Preview {
    SelectedNodes()
        .environment(AppState())
}
