resource "kubernetes_service" "jobsbolt_prometheus_service" {
  metadata {
    name = "jobsbolt-prometheus-service"
  }
  spec {
    selector = {
      app       = "jobsbolt"
      component = "prometheus"
    }
    port {
      port        = 9090 # External Port
      target_port = 9090 # Internal Port
    }

    type = "ClusterIP"
  }
}
