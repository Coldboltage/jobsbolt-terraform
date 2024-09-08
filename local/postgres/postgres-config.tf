resource "kubernetes_config_map" "jobsbolt_postgres_config" {
  metadata {
    name = "jobsbolt-postgres-config"
  }

  data = {
    TYPEORM_USERNAME = "coldbolt"
    TYPEORM_DATABASE = "jobsbolt"
  }
}
