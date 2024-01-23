package com.michael.usgapi.controllers

import com.michael.usgapi.models.CreateNode
import com.michael.usgapi.models.ListNodesRequest
import com.michael.usgapi.models.ListNodesResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import com.michael.usgapi.services.Graph1
import org.springframework.web.bind.annotation.ResponseBody

@RestController
class NodeCtrl (
  @Autowired
  val graph1: Graph1,
    ) {

  @PostMapping("/createNode")
  @ResponseBody
  fun createNode(@RequestBody req: CreateNode): ListNodesResponse {
    return graph1.createNode(req.type, req.props)
  }

  @PostMapping("/listNodes")
  @ResponseBody
  fun listNodes(@RequestBody req: ListNodesRequest): ListNodesResponse {
    return graph1.listNodes(req)
  }
}