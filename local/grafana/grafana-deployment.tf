resource "kubernetes_deployment" "jobsbolt_grafana_deployment" {
  metadata {
    name = "terraform-grafana-deployment"
    labels = {
      app       = "jobsbolt"
      component = "grafana"
      env       = "dev"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app       = "jobsbolt"
        component = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app       = "jobsbolt"
          component = "grafana"
        }
      }

      spec {
        volume {
          name = "jobsbolt-grafana-storage"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.jobsbolt_grafana_pvc.metadata[0].name
          }
        }

        container {
          image = "grafana/grafana"
          name  = "jobsbolt-grafana"

          volume_mount {
            name       = "jobsbolt-grafana-storage"
            mount_path = "/var/lib/grafana" # Path inside the container where the volume is mounted
          }

          port {
            container_port = 3000 # The internal Grafana port
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
