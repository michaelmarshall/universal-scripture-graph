//
//  CreateNodeForm.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/17/24.
//

import SwiftUI

struct CreateNodeForm: View {
    
    @Environment(AppState.self) var appState: AppState

    let client: DataClient
    
    @State var nodeType: NodeType = .Person
    
    @State var person = ""
    @State var name = ""
    
    @State var requestInProgress = false
    
    @State var response: [Node] = []
    
    init (client: DataClient){
        self.client = client
    }
    
    var body: some View {
        
        Form {
            Text("Create Node")
            
            Section {
                Picker("Node Type", selection: $nodeType){
                    ForEach(NodeType.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
            }
            
            Section {
                if self.nodeType == NodeType.Person {
                    TextField("person", text: $person) {}
                }
                
                if self.nodeType == NodeType.City {
                    TextField("name", text: $name) {}
                }
            }
            
            Section {
                Button("Create Node") {
                    self.requestInProgress = true
                    Task {
                        
                        if nodeType == NodeType.Person {
                            client.createNode(req: CreateNodeRequest(
                                    type: nodeType,
                                    props: Props(person: person)
                            ))
                        } else if nodeType == NodeType.City {
                            client.createNode(req: CreateNodeRequest(
                                    type: nodeType,
                                    props: Props(name: name)
                            ))
                        }
                                                
                        self.requestInProgress = false
                        name = ""
                        person = ""
                    }
                    
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CreateNodeForm(client: DataClient(appState: AppState()))
        .environment(AppState())
}
