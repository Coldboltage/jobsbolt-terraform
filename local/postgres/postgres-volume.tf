resource "kubernetes_persistent_volume" "jobsbolt_postgres_volume" {
  metadata {
    name = "jobsbolt-postgres-volume"
    labels = {
      type = "postgres-storage"
    }
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteOnce"]

    persistent_volume_source {
      host_path {
        path = "/host_mnt/c/Users/aland/Documents/projects/jobsbolt/dev/terraform-postgres-data"
      }
    }
  }
}
