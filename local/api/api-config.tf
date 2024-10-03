resource "kubernetes_config_map" "jobsbolt_api_config" {
  metadata {
    name = "jobsbolt-api-config"
  }

  data = {
    TYPEORM_TYPE      = "postgres"
    TYPEORM_HOST      = "jobsbolt-postgres-service"
    TYPEORM_PORT      = "5432"
    TYPEORM_USERNAME  = "coldbolt"
    TYPEORM_DATABASE  = "jobsbolt"
    RABBITMQ_URL      = "jobsbolt-rabbit-service"
    GENERAL_TEST      = "false"
    FIND_JOB          = "false"
    TEST_BATCH        = "false"
    DISCORD_TEST      = "false"
    FULL_TEST         = "false"
    RABBITMQ_USERNAME = "guest"
    SEEDER_NAME       = "admin"
    SEEDER_EMAIL      = "test@email.com"
  }
}
