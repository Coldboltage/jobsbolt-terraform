resource "kubernetes_persistent_volume" "jobsbolt_grafana_volume" {
  metadata {
    name = "jobsbolt-grafana-volume"
    labels = {
      type = "grafana-storage"
    }
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]

    persistent_volume_source {
      host_path {
        path = "/host_mnt/c/Users/aland/Documents/projects/jobsbolt/dev/terraform-grafana-data"
      }
    }
  }
}
