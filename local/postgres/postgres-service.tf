resource "kubernetes_service" "jobsbolt_postgres_service" {
  metadata {
    name = "jobsbolt-postgres-service"
  }
  spec {
    selector = {
      app       = "jobsbolt"
      component = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
      node_port   = 30000
    }

    type = "NodePort"
  }
}

