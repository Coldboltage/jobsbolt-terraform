resource "kubernetes_deployment" "jobsbolt_prometheus_deployment" {
  metadata {
    name = "jobsbolt-prometheus-deployment"
    labels = {
      app       = "jobsbolt"
      component = "prometheus"
      env       = "dev"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app       = "jobsbolt"
        component = "prometheus"
      }
    }

    template {
      metadata {
        labels = {
          app       = "jobsbolt"
          component = "prometheus"
        }
      }

      spec {
        volume {
          name = "prometheus-config"
          config_map {
            name = kubernetes_config_map.jobsbolt_prometheus_config.metadata[0].name
          }
        }
        container {
          image = "prom/prometheus"
          name  = "jobsbolt-prometheus"

          volume_mount {
            name       = "prometheus-config"
            mount_path = "/etc/prometheus/prometheus.yml"
            sub_path   = "prometheus.yml"
          }

          port {
            container_port = 9090 # The internal Grafana port
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}
