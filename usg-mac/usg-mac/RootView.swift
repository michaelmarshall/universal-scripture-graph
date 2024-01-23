//
//  ContentView.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/14/24.
//

import SwiftUI

struct RootView: View {
    
    @State var appState: AppState
    let client: DataClient
    
    init(){
        let appState = AppState()
        self.client = DataClient(appState: appState)
        self.appState = appState
    }
    
    var body: some View {
        HStack{
                        
            VStack {
                ScrollView {
                    SearchForm(client: client)
                        .environment(appState)
                    SearchResults()
                        .environment(appState)
                    Spacer()
                    
                    CreateNodeForm(client: client)
                        .environment(appState)
                }
            }
            .padding()
        
            
            VStack {
                ScrollView {
                    SelectedNodes()
                        .environment(appState)
                    
                    RelatedNodes()
                        .environment(appState)
                }

            }
            .padding()
            
        }
    }
}

#Preview {
    RootView()
}
