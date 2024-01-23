package com.michael.usgapi.core

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.jdbc.DataSourceBuilder
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import javax.sql.DataSource

@Configuration
class DataSourceConfiguration {
  @Bean("postgres1Bean")
  @ConfigurationProperties("spring.datasource")
  fun writerDataSource(): DataSource {
    return DataSourceBuilder.create().build()
  }
}