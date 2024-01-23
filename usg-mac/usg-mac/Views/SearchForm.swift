//
//  NodeSearch.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import SwiftUI

struct SearchForm: View {
    
    @Environment(AppState.self) var appState: AppState
    
    let client: DataClient
    
    @State private var searchText = ""
    
    init(client: DataClient){
        self.client = client
    }
    
    var body: some View {
        Text("Search")
        Form {
            //TextField("", text: $searchText)
            Button("Submit"){
                client.getNodesList(req: ListNodesRequest(offset: 0, limit: 10))
            }
        }
    }
}



//#Preview {
//    SearchForm(client: previewClient)
//        .environment(previewAppState)
//}
