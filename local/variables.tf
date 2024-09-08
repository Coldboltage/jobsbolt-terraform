variable "TYPEORM_PASSWORD" {
  type      = string
  sensitive = true
}

variable "JWT_SECRET" {
  type      = string
  sensitive = true
}

variable "OPENAI_API_KEY" {
  type      = string
  sensitive = true
}

variable "DISCORD_KEY" {
  type      = string
  sensitive = true
}

variable "RABBITMQ_PASSWORD" {
  type      = string
  sensitive = true
}
