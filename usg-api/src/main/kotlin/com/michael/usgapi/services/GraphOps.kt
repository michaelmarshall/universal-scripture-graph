package com.michael.usgapi.services

import com.michael.usgapi.models.ListNodesRequest
import com.michael.usgapi.models.ListNodesResponse
import com.michael.usgapi.models.Node
import com.michael.usgapi.models.Properties
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate
import org.springframework.stereotype.Component
import javax.sql.DataSource

@Component
class Graph1(
  @Autowired
  @Qualifier("postgres1Bean")
  val ds: DataSource,
) {
  val jdbcTemplate = NamedParameterJdbcTemplate(ds)

  fun createNode(type: String, props: Properties): ListNodesResponse {
    val params = MapSqlParameterSource()
    params.addValue("type", type)
    params.addValue("props", Json.encodeToString(props))

    //language=SQL
    val result = jdbcTemplate.queryForRowSet(
      """
      insert into nodes(
        type, 
        props
      )
      values(
        :type, 
        :props::jsonb
      )
      returning id, type, props;
    """.trimIndent(), params
    )

    if (result.next()) {

      val id = result.getLong("id")
      val type = result.getString("type")
      val value = Json.decodeFromString<Properties>(result.getString("props")!!)

      if (id != null && type != null && value != null) {
        return ListNodesResponse(
          nodes = mutableListOf(
            Node(
              id,
              type,
              value,
            )
          )
        )
      }

    }

    return ListNodesResponse(
      nodes = mutableListOf()
    )
  }

  fun createRelationship(fromNode: Long, toNode: Long, relType: String, relValueString: String): Long? {

    val params = MapSqlParameterSource()
    params.addValue("from_id", fromNode)
    params.addValue("to_id", toNode)

    //language=SQL
    val result = jdbcTemplate.queryForRowSet(
      """
      insert into relationships(
        from_id,
        to_id
      )
      values(
        :from_id,
        :to_id
      )
      returning id;
    """.trimIndent(), params
    )

    return if (result.next()) {
      result.getLong("id")
    } else {
      null
    }

  }

  fun listNodes(req: ListNodesRequest): ListNodesResponse {

    val params = MapSqlParameterSource()
    params.addValue("offset", req.offset)
    params.addValue("limit", req.limit)

    //language=SQL
    val result = jdbcTemplate.queryForRowSet(
      """
        select *
        from nodes
        limit :limit
        offset :offset
      """.trimIndent(), params
    )

    var arr: MutableList<Node>? = null

    while (result.next()) {

      val id = result.getLong("id")
        ?: continue

      val type = result.getString("type")
        ?: continue

      val value = Json.decodeFromString<Properties>(result.getString("props")!!)
        ?: continue

      val node = Node(
        id,
        type,
        value,
      )

      if (arr == null) arr = mutableListOf()

      arr.add(node)
    }

    if (arr != null) {
      return ListNodesResponse(
        nodes = arr,
      )
    }

    return ListNodesResponse(
      nodes = listOf()
    )
  }

}