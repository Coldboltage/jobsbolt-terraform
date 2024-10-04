resource "kubernetes_service" "jobsbolt_grafana_service" {
  metadata {
    name = "jobsbolt-grafana-service"
  }
  spec {
    selector = {
      app       = "jobsbolt"
      component = "grafana"
    }
    port {
      port        = 3001
      target_port = 3000
    }

    type = "ClusterIP"
  }
}
