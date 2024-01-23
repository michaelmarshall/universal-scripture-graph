package com.michael.usgapi.models

import kotlinx.serialization.Serializable

@Serializable
data class Properties (
  val person: String? = null,
  val name: String? = null,
)

@Serializable
data class Node(
  val id: Long,
  val type: String,
  val props: Properties,
)

@Serializable
data class Relationship(
  val id: Long,
  val from: Long,
  val to: Long,
)

@Serializable
data class CreateNode(
  val type: String,
  val props: Properties,
)

@Serializable
data class ListNodesRequest(
  val offset: Int,
  val limit: Int,
)

@Serializable
data class ListNodesResponse(
  val nodes: List<Node>
)