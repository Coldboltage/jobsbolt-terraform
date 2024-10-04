resource "kubernetes_config_map" "jobsbolt_config" {
  metadata {
    name = "jobsbolt-config"
  }

  data = {
    TYPEORM_TYPE      = "postgres"
    TYPEORM_HOST      = "jobsbolt-postgres"
    TYPEORM_PORT      = "5432"
    TYPEORM_USERNAME  = "coldbolt"
    TYPEORM_DATABASE  = "jobsbolt-local-dev"
    RABBITMQ_URL      = "jobsbolt-rabbit"
    GENERAL_TEST      = "false"
    FIND_JOB          = "false"
    TEST_BATCH        = "false"
    DISCORD_TEST      = "false"
    FULL_TEST         = "false"
    RABBITMQ_USERNAME = "guest"
  }
}
