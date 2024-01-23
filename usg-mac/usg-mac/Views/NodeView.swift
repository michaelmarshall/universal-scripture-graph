//
//  NodeView.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import SwiftUI

struct NodeView: View {
    let node: Node
    var body: some View {
        
        HStack {
            Text(String(node.id))
            Text(node.type.rawValue)
            
            switch (node.type){
            case NodeType.Person:
                if node.props.person != nil {
                    Text(node.props.person!)
                }
            case NodeType.City:
                if node.props.name != nil {
                    Text(node.props.name!)
                }
            default:
                Text("unknown type")
            }
            
        }        
    }
}

#Preview {
    NodeView(
        node: Node(
            id: 1,
            type: NodeType.Person,
            props: Props(person: "Michael")
        )
    )
}
