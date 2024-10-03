resource "kubernetes_persistent_volume_claim" "jobsbolt_postgres_pvc" {
  metadata {
    name = "jobsbolt-postgres-pvc"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "2Gi"
      }
    }
    selector {
      match_labels = {
        type = "postgres-storage" # Match the label from the PV
      }
    }
  }
}
