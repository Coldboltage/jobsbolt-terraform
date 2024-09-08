resource "kubernetes_persistent_volume" "jobsbolt_postgres_volume" {
  metadata {
    name = "jobsbolt-postgres-volume"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteOnce"]

    persistent_volume_source {
      host_path {
        path = "/host_mnt/c/Users/aland/Documents/projects/jobsbolt/terraform-postgres-data"
      }
    }
  }
}
