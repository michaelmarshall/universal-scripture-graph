//
//  DataClient.swift
//  usg-mac
//
//  Created by Michael Marshall on 1/15/24.
//

import Foundation

class DataClient {
    
    var appState: AppState
    
    init(appState: AppState){
        self.appState = appState
    }

    func getNodesList(req: ListNodesRequest, endpoint: String = "listNodes") {
                        
        NetworkManager.shared.postRequestWithNodeListResponse(
            endpoint: endpoint,
            body: req,
            res: ListNodesResponse(
                nodes: []
            )
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let res):
                    self.appState.searchResultNodes = res.nodes
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        return
    }
    
    func createNode(req: CreateNodeRequest, endpoint: String = "createNode") {
        NetworkManager.shared.postRequestWithNodeListResponse(
            endpoint: endpoint,
            body: req,
            res: ListNodesResponse(
                nodes: []
            )
        ){ result in
            DispatchQueue.main.async {
                switch result {
                case .success(let res):
                    self.appState.createNodeResponse = res.nodes
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        return
    }

}
