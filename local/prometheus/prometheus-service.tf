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
      port        = 9090  # External Port
      target_port = 9090  # Internal Port
      node_port   = 32000 # Choose a port between 30000-32767

    }

    type = "NodePort"
  }
}
