resource "kubernetes_config_map" "jobsbolt_api_config" {
  metadata {
    name = "jobsbolt-api-config"
  }

  data = {
    TYPEORM_TYPE = "postgres"
    TYPEORM_HOST = "jobsbolt-postgres-service.default.svc.cluster.local"
    # TYPEORM_HOST     = "10.244.0.20"
    TYPEORM_PORT     = "5432"
    TYPEORM_USERNAME = "coldbolt"
    TYPEORM_DATABASE = "jobsbolt"
    RABBITMQ_URL     = "jobsbolt-rabbit-service"
    # RABBITMQ_URL      = "10.1.0.57"
    GENERAL_TEST      = "false"
    FIND_JOB          = "false"
    TEST_BATCH        = "false"
    DISCORD_TEST      = "false"
    FULL_TEST         = "false"
    RABBITMQ_USERNAME = "guest"
  }
}
