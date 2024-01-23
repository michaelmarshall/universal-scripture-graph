//
//  NodeList.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/14/24.
//

import SwiftUI

struct NodeList: View {

    let nodes: [Node]
    
    init (nodes: [Node]){
        self.nodes = nodes.sorted(by: { n1, n2 in
            n1.id < n2.id
        })
    }
    
    var body: some View {
        VStack {
            Text("Selected Node")
            
            ForEach(nodes, id: \.self) { node in
                NodeView(node: node)
            }
        }
        .padding()
    }
    

}

#Preview {
    NodeList(nodes: [Node(id: 1, type: NodeType.Person, props: Props(person: "Michael"))])
}
